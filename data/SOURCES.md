# Sources - Project 02: Recycling in Canada (REAL data)

All data is real and from official Canadian sources. No simulation. Cite these.

## National plastic fate (the hook)
Environment and Climate Change Canada (ECCC), *Economic Study of the Canadian Plastic Industry, Markets and Waste* (2019, base year 2016):
- Canada generated **3.3 million tonnes** of plastic waste in 2016.
- Only **9% was recycled**; **86% landfilled**, **4% incinerated (energy recovery)**, **1% (29,000 t) leaked** to the environment.
- Estimated **lost material value of $7.8 billion in 2016**, projected to reach **$11 billion by 2030** at current recovery rates.
- Included as `data/canada_plastic_fate_2016_ECCC.csv`.

Links:
- Canada.ca - Plastic waste and pollution reduction: https://www.canada.ca/en/environment-climate-change/services/managing-reducing-waste/reduce-plastic-waste.html
- StatCan feature - "The message in a bottle: Plastic packaging waste": https://www.statcan.gc.ca/o1/en/plus/3797-message-bottle-plastic-packaging-waste
- House of Commons ENVI report "The Last Straw": https://www.ourcommons.ca/Content/Committee/421/ENVI/Reports/RP10583500/envirp21/envirp21-e.pdf

## Provincial recycling / diversion (the deep-dive you download)
Statistics Canada, downloadable CSV tables (use the "Download options -> CSV" button on each):
- **Table 38-10-0138** - Waste materials diverted, by type and by source (includes a **Plastics** material category, by province, every 2 years): https://open.canada.ca/data/dataset/233bd940-5fc0-4ed0-b676-1db3203115d0
- **Solid waste diversion and disposal** (CESI, by province, per person): https://open.canada.ca/data/en/dataset/301c6b51-8b35-4770-a851-fe51448e4d2b
- StatCan Daily - Biennial Waste Management Survey, Diversion 2022: https://www150.statcan.gc.ca/n1/daily-quotidien/240408/dq240408b-eng.htm

## How to pull the provincial data (2 minutes)
1. Open the Table 38-10-0138 link, click **Statistics Canada table** / the StatCan table page.
2. Use **Add/Remove data** to select: Geography = all provinces, Material = **Plastics** (and "Total materials" for the denominator), all available years.
3. **Download options -> CSV (download as displayed)**. Save into `data/`.
4. Do the same for the disposal table if you want diversion *rates* (diverted / (diverted + disposed)).


## Current status (the 2026 "on track?" view)
- Plastic waste is **rising**: ~3.5 Mt (2012) -> ~4 Mt (2018) -> ~5 Mt (2021); the recycling rate is **still ~9%**.
- Lost material value is now roughly **$8 billion/year**, projected **$11 billion by 2030** at current rates.
- A circular plastics economy could add **~$8B in recovered value and ~42,000 jobs by 2030** (ECCC / circular-economy studies).
- Policy driving demand: **50% recycled content in plastic packaging by 2030**, single-use bans, and **Extended Producer Responsibility (EPR)**.
- **2024 Auditor General / CESD "Report 3 - Zero Plastic Waste"**: ECCC's performance framework lacked the data to tell whether the 2030 target is on track: https://www.oag-bvg.gc.ca/internet/English/parl_cesd_202404_03_e_44470.html
- Circular Innovation Council summary ("Canada recycles just 9%"): https://circularinnovation.ca/canada-recycles-just-9-per-cent-of-its-plastics/
