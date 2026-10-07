# Data prep in Power Query - Project 02

Goal: clean the three real files into one tidy model keyed on **Geography x Year** so you can cross-analyse (plastics diverted, per-capita, source split, trend, total-waste rate context).

## Target model
- **Fact:** `PlasticsDiverted` - Geography, Year, Source (All / Residential / Non-residential), Tonnes.
- **Dim:** `Population` - Geography, Year, Population (for per-capita).
- **Context:** `WastePerCapita2020` - total-waste diverted & disposed per person (rate context, 2020 only).
- **Reference:** `NationalFate2016` - the ECCC 9% split (single national number).

Load each as its own query (Data -> Get Data -> From Text/CSV, then "Transform"), then merge.

---

## Query 1 - PlasticsDiverted (from `38100138.csv`)
This file is already tidy (long format). Steps:
1. Get Data -> From Text/CSV -> `38100138.csv`. First row is headers (promote if needed).
2. **Choose/Remove columns** - keep only: `REF_DATE`, `GEO`, `Type of materials diverted`, `Sources of materials prepared for recycling`, `VALUE`. Remove the rest (DGUID, UOM, VECTOR, COORDINATE, STATUS, SYMBOL, etc.).
3. **Rename:** REF_DATE -> `Year`; GEO -> `Geography`; Type of materials diverted -> `Material`; Sources... -> `Source`; VALUE -> `Tonnes`.
4. **Filter** `Material` = **Plastics** (Text Filters -> Equals). (Optional: keep a second query filtered to `All materials diverted` so you can compute plastics' share of total.)
5. **Replace values / types:** `Year` -> Whole Number; `Tonnes` -> Decimal Number. Suppressed cells come in blank or as ".." - Replace Values ".." with null, then set type (errors -> Replace Errors with null).
6. **Tidy `Source`** (Replace Values): "All sources of diverted materials" -> `All`; "Residential sources of diverted materials" -> `Residential`; "Non-residential sources of diverted materials" -> `Non-residential`.
7. **Trim** `Geography` (Format -> Trim) so joins match cleanly.
8. Optional: **Pivot** `Source` into columns (Transform -> Pivot Column, Values = Tonnes, Advanced -> Don't Aggregate) if you'd rather have All/Residential/Non-residential side by side. For charting trend and maps, the long form (step 6) is usually easier - keep both if unsure.

Result: one row per Geography x Year x Source, with Tonnes.

## Query 2 - Population (province x year)  [needed for per-capita]
The diverted file has no population. Bring it in:
- Download StatCan **Table 17-10-0009** (Population estimates, quarterly) -> filter to the provinces and Q3 (July) of 2018, 2020, 2022 -> CSV. Clean the same way: keep Geography, Year, Population; rename; set types; Trim Geography.
- (If you want to move fast, you can Enter Data manually with the July population per province per year and mark it to verify against 17-10-0009 - but for a LinkedIn piece, use the real download.)

Then you can compute **per-capita** after the merge: `Diverted_kg_per_person = [Tonnes] * 1000 / [Population]`.

## Query 3 - WastePerCapita2020 (from `3-by-jurisdiction-en.csv`)
This one has title rows and is wide. Steps:
1. Get Data -> From Text/CSV.
2. **Remove Top Rows = 2** (the title and blank line), then **Use First Row as Headers**.
3. Keep `Jurisdiction`, `Total waste diverted (kilograms per person)`, `Total waste disposed (kilograms per person)` (drop the by-source columns unless you want them).
4. **Replace `x`** (suppressed) with null; set the kg columns to Decimal.
5. Rename `Jurisdiction` -> `Geography`; Trim.
6. Add column `TotalWaste_DiversionRate = [Diverted] / ([Diverted] + [Disposed])`.
> Note: this is **total waste**, not plastic. Use it as context ("who diverts well overall"), clearly labelled - do not present it as a plastic rate.

## Query 4 - NationalFate2016 (from `canada_plastic_fate_2016_ECCC.csv`)
Already clean. Load as-is (fate, tonnes_2016, share_pct). This feeds the "9% recycled" hook chart. It does not join to the others (different grain) - keep it standalone.

---

## Merge (the cross-analysis model)
1. **Merge** `PlasticsDiverted` with `Population` on **Geography + Year** (Home -> Merge Queries -> select both key columns in each). Expand Population.
2. Add the per-capita column (formula above).
3. Optionally **Merge** in `WastePerCapita2020` on Geography (2020 rows only) to sit the total-waste rate beside plastics.
4. Filter out the roll-up rows for province comparisons: exclude `Canada` and `Yukon, Northwest Territories and Nunavut` when ranking provinces (keep `Canada` for the national trend line).

## What you can now cross-analyse
- Plastics diverted by province, **absolute vs per-capita** (they rank differently).
- **Trend 2018-2020-2022** national and by province -> project to 2030 vs the goal.
- **Residential vs non-residential** share by province.
- Plastics' **share of all diverted materials** (if you kept Query 1b).
- Total-waste diversion rate as a **context** column beside plastics.

## Housekeeping
- Keep queries as **connection-only** + one merged output table loaded to the sheet/model.
- Name queries clearly; this query chain *is* a portfolio artefact - screenshot the Applied Steps for your write-up.
- Watch the suppressed cells (PEI and territories have gaps in 2022) - they should be null, not zero.
