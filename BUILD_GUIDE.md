# Project 02 - Recycling in Canada: the 9% Problem
### Your end-to-end build guide (real data; you build it; this is the map)

> Goal: a LinkedIn-ready, defensible analysis built entirely on official Canadian data (ECCC + Statistics Canada). Same shape as Project 01: context, questions, data model, KPIs, build steps, charts, interpretation, recommendation, limitations, defence. No simulated data anywhere.

---

## 1. The real-world situation (know this cold)
Canadians think of themselves as recyclers - blue bins everywhere. The official numbers say otherwise. Environment and Climate Change Canada's *Economic Study of the Canadian Plastic Industry, Markets and Waste* found that in 2016 Canada generated **3.3 million tonnes of plastic waste and recycled only 9% of it** - 86% landfilled, 4% burned for energy, 1% leaked into the environment. Plastic waste has kept climbing since (about **4 million tonnes by 2018 and close to 5 million by 2021**), while the recycling rate **has not moved off 9%**. ECCC put the wasted material value at roughly **$8 billion a year, on track for $11 billion by 2030** if nothing changes.

Canada has committed to **zero plastic waste by 2030** - 100% of plastics reduced, reused, or recycled (only ~30% qualified in 2016). With 2026 now here, the honest question is: **is Canada actually on track?** The 2024 report from the Commissioner of the Environment and Sustainable Development (Auditor General) found ECCC **could not reliably measure progress** - the performance framework was missing key data - so nobody in government could say whether the target was within reach. That gap is the opening for this project: use the official numbers to test the 2030 promise from the outside.

**Target of this analysis:** using StatCan plastics-diversion data (2018-2022) and the ECCC national fate figures, judge whether Canada is on pace for zero plastic waste by 2030, quantify the material value still being lost, and show where the gap is worst.

**One-sentence problem:** *Canada still recycles only 9% of its plastic and the government cannot say if 2030 is reachable; the data has to answer whether we are on track, what it is costing, and where diversion is and is not working.*

### Business context (why this is a commercial story, not only an environmental one)
The 91% that is not recycled is not just pollution - it is thrown-away money and a supply chain that does not exist yet. ECCC and circular-economy studies put the lost material value near **$8 billion a year now, $11 billion by 2030**, and estimate that building a circular plastics economy could add **billions in revenue and about 42,000 jobs by 2030**. Policy is already turning that into demand: a **50% recycled-content requirement for plastic packaging by 2030**, single-use item bans, and **Extended Producer Responsibility** shifting recycling costs onto the companies that make the plastic. So "who diverts plastic and who does not" is really a map of where that $8 billion - and the feedstock for the recycled-content rules - will actually come from. Recyclers, brand owners, and provincial programs are the business readers for this piece.


## 2. Who the decision-maker / audience is
For LinkedIn, write for two readers at once:
- **A policy / sustainability audience** (municipal and provincial waste leads, EPR program owners) who act on province-level diversion.
- **A general professional audience** who will share the "only 9%" story.
Frame every chart so both get it in five seconds.

## 3. Problem statement
The 9% recycling rate is a single national number that hides big provincial differences and a decade of (slow) change. Decompose it: how much plastic is diverted, by which province, from residential vs business sources, and is the trend improving fast enough for zero waste by 2030.

## 4. Key questions
1. **Where does Canada's plastic actually go?** The national fate split (9% recycled) and the $ value lost.
2. **Which provinces divert the most plastic?** Absolute tonnes and **per capita** (they rank differently).
3. **Is Canada on track for 2030?** Trend of plastics diverted (2018-2022), projected forward against the zero-waste goal - is the slope anywhere near enough?
4. **Residential vs non-residential.** Where does diverted plastic come from, and which source is growing?
5. **Rate vs volume.** Diversion rate = diverted / (diverted + disposed). Who is efficient, not just big?
6. **So what?** What would move the national 9%, and what is the prize in tonnes and dollars.

## 5. Data model (real sources)
Two layers, both official:
- **National fate (hook):** `data/canada_plastic_fate_2016_ECCC.csv` (already here - real ECCC figures).
- **Provincial deep-dive (you download):** StatCan **Table 38-10-0138** "Waste materials diverted, by type" filtered to **Plastics**, by province and year; plus the disposal table for rates. Download steps are in `data/SOURCES.md`.
Grain of the provincial table: **province x year x material x source (residential / non-residential)**. Join a **province population** column (StatCan Table 17-10-0009) to get per-capita. Build derived fields: `diversion_rate = diverted / (diverted + disposed)`, `per_capita_kg = diverted_tonnes * 1000 / population`, `year_over_year_change`.

## 6. KPIs
| KPI | How measured | Why it matters |
|---|---|---|
| National recycling rate | recycled / total plastic waste | The headline: 9%. |
| Lost material value ($) | ECCC estimate | Turns waste into money ($7.8B). |
| Plastics diverted (tonnes) | StatCan 38-10-0138, Plastics | The absolute prize by province. |
| Diversion per capita (kg) | diverted x 1000 / population | Fair province comparison. |
| Diversion rate (%) | diverted / (diverted + disposed) | Efficiency, not just size. |
| Trend / CAGR | change across years | Are we on track for 2030? |
| Residential share | residential / total diverted | Where the tonnes come from. |

## 7. Build it - step by step
- **Excel first:** clean the StatCan download (it has header notes and footnote rows - strip them), pivot plastics diverted by province and year, add population and the derived fields.
- **SQL (one query per question):** diverted by province (rank absolute and per-capita); diversion rate by province; trend by year; residential vs non-residential; a query for the national-fate context.
- **Python:** trend line + simple linear projection to 2030 vs the "zero waste" goal; a concentration check (which 2-3 provinces hold most of the diverted tonnes); export tidy CSVs.
- **Datawrapper (the star for this one):**
  | Question | Chart | Datawrapper type |
  |---|---|---|
  | Where plastic goes | National fate: 9% recycled vs the rest | Bar or donut (from the ECCC CSV) |
  | Who diverts most | **Canada choropleth**, plastics diverted per capita by province | Choropleth map (Canada / provinces) |
  | Ranking | Ranked bar of diverted tonnes by province | Bar chart |
  | Trend | Line of national plastics diverted, with 2030 goal line | Line chart |
  | Efficiency | Diversion rate by province | Bar chart |
  Datawrapper has a built-in **Canada provinces choropleth** - that map of per-capita plastic diversion is your signature LinkedIn visual. Pair it with the stark "9%" fate chart as the opener.

## 8. How to read it (the LinkedIn story arc)
Open on the gap: Canadians believe they recycle; only 9% of plastic actually is. Then the map: diversion is very uneven across provinces. Then the trend: it is improving, but nowhere near fast enough for 2030. Close on the number that makes people share it: $7.8B of material value thrown away in a single year.

## 9. Recommendation & impact
Tie 2-3 actions to what the data shows: concentrate Extended Producer Responsibility and deposit-return where diversion rate is lowest; standardise what is accepted in bins across provinces (contamination kills recycling); set province-level diversion targets that ladder up to the 2030 goal. Quantify the prize: moving the national rate from 9% toward even 20% against the $7.8B lost-value figure.

## 10. Limitations
The 9% national fate is a 2016 study (the most complete plastic-specific national estimate) - flag the year. StatCan diversion tables cover total waste with a plastics category, are collected every two years, and count only municipally- and industry-managed streams, so they undercount some flows. Per-capita needs a matching population year. Provinces differ in what they report. State each clearly.

## Defend it anywhere
- "Is the 9% current?" It is the 2016 ECCC study, still the most cited national plastic-specific figure; provincial trends since then come from StatCan. Name both.
- "Why per capita?" Ontario and Quebec divert the most tonnes simply because they are biggest; per-capita and rate show who is actually efficient.
- "Where did the data come from?" 100% official - ECCC and Statistics Canada, links in SOURCES.md. That is the whole point of doing it on real data.
