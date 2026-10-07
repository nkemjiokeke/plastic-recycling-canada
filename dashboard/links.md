# Dashboard - Project 02 visualisations

All built on real Statistics Canada and ECCC data. Flourish edit links need a login; use Publish to get an embed link.

## Flourish charts (built)
| # | What it shows | Type | Link |
|---|---|---|---|
| 1 | Plastic diverted nationally, 2018-2022 (flat) | Line | https://app.flourish.studio/visualisation/29973287/edit |
| 2 | Plastic diverted by province, 2022 (top 3 = 79%) | Ranked bar | https://app.flourish.studio/visualisation/29973288/edit |
| 3 | Residential vs non-residential, 2022 (71% vs 27%) | Donut | https://app.flourish.studio/visualisation/29973289/edit |
| 4 | National plastic fate (9% recycled) | Donut | https://app.flourish.studio/visualisation/29973290/edit |
| 5 | Total tonnes vs per person, by province | Scatter | https://app.flourish.studio/visualisation/29973397/edit |

Chart 5 is the one that shows a province can be large in total but small per person: Ontario sits far right (largest total) but low on the vertical axis, while Nova Scotia sits high but small in total.

## Map - build in Datawrapper (best Canada choropleth)
1. datawrapper.de, New map, Choropleth map, base map "Canada / Provinces and Territories".
2. Upload `assets/map_datawrapper_per_capita.csv` (columns: geography, kg_per_person, tonnes).
3. Match geography to the province names (they match; PEI and territories are blank because 2022 is suppressed).
4. Colour by kg_per_person. Title: "Plastic diverted per person by province, 2022."
5. Publish and paste the embed link here.

Source CSVs are in `/assets`.
