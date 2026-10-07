# Recycling in Canada: the 9% Problem
> Sector: Environment / Public Policy. Data: Statistics Canada and Environment and Climate Change Canada (official). Tools: Power Query, SQL, Datawrapper. Method: benchmarking and geospatial analysis.

All figures in this report come from official Canadian sources. Full citations are in `data/SOURCES.md`.

## Executive summary
Canada has set a target of eliminating plastic waste by 2030, but the available data indicates the country is not on course to meet it. About 9% of Canada's plastic is recycled, and the amount of plastic diverted for recycling changed very little between 2018 and 2022. Environment and Climate Change Canada estimates that the plastic Canada does not recover is worth roughly $8 billion a year. When the national figure is broken down by province, two patterns are clear: most of the plastic that is diverted comes from household collection rather than from businesses, and a small number of provinces account for the large majority of the national total. Those are the two areas where any meaningful improvement would have to come from.

## 1. Business context
Plastic recycling in Canada is usually discussed as an environmental issue, but it also has a clear economic dimension. Environment and Climate Change Canada estimates that Canada recycles about 9% of its plastic and that the remaining material, which is landfilled, incinerated or lost, represents a lost value of roughly $8 billion a year, rising to about $11 billion by 2030 if current rates continue. Canada has committed to eliminating plastic waste by 2030 and has introduced policies that will increase demand for recycled plastic, including a requirement for 50% recycled content in plastic packaging, bans on several single-use items, and extended producer responsibility rules that make producers responsible for the cost of recycling. For that reason, understanding which provinces divert plastic and which do not helps identify where recycled material and recycling capacity will need to come from. Since it is now 2026, it is reasonable to ask whether the 2030 target is still achievable. A 2024 report by the Commissioner of the Environment and Sustainable Development found that the federal government did not have the data needed to measure its own progress, so this analysis assesses the situation using publicly available official data.

## 2. Audience
This analysis is intended for two groups. The first is people working in waste policy and programs at the provincial level, including those responsible for extended producer responsibility programs. The second is people in the recycling and packaging industries who need to understand where recycled plastic feedstock is likely to come from. Both groups need the same information: where diversion is working, where it is not, and where the largest volumes are.

## 3. Problem statement
The national recycling rate of 9% is a single figure that does not explain the situation underneath it. It does not show whether recycling is improving over time, which provinces divert the most plastic, whether the plastic comes from households or businesses, or whether the 2030 target is realistic. This analysis breaks the national figure down by province, year and source in order to answer those questions with the available data.

## 4. Key questions
1. Is Canada on track to meet the 2030 target? What is the trend in plastic diverted, and where does it project to?
2. Which provinces divert the most plastic, both in total tonnes and per person?
3. How concentrated is diversion across the provinces?
4. Does the diverted plastic come mainly from households or from businesses?
5. Are the provinces that divert waste well also the ones that divert plastic well?
6. Given all of this, where is the opportunity, and what would move the national figure?

## 5. Data model
The analysis is based on a single dataset assembled in Power Query from three official sources. The main source is Statistics Canada Table 38-10-0138, Waste materials diverted by type and source, filtered to plastics. It provides the tonnes of plastic diverted by province for 2018, 2020 and 2022, separated into residential and non-residential sources. Provincial population estimates from Statistics Canada Table 17-10-0009 were merged on province and year to calculate diversion per person. The 2020 total-waste diversion rate per person was added as context, and the national plastic fate figures from Environment and Climate Change Canada were kept as a national reference.

Each row represents one province, year and source. Diversion per person is calculated as tonnes multiplied by 1,000 and divided by population. Two adjustments were made during preparation. Population was limited to a single quarter per year so that the merge would not duplicate rows, and suppressed values for Prince Edward Island and the territories in 2022 were left blank rather than treated as zero. The full preparation steps are documented in `DATA_PREP_POWER_QUERY.md`.

## 6. KPIs
| KPI | How it is measured | Value |
|---|---|---|
| National recycling rate | recycled divided by total plastic waste | 9% (ECCC, 2016) |
| Lost material value | ECCC estimate | about $8 billion a year, rising to $11 billion by 2030 |
| Plastic diverted (national) | sum of provinces, all sources | about 365,000 tonnes in 2022, roughly flat since 2018 |
| Diverted per person | tonnes times 1,000 divided by population | Nova Scotia 14.5 kg (highest) to Newfoundland 3.0 kg; Ontario 7.9 kg |
| Concentration | share held by the top three provinces | 79% (Ontario, Quebec and British Columbia) |
| Residential share | residential divided by total diverted | 71% |
| Projected 2030 diversion | linear projection of diverted volume | about 389,000 tonnes, well short of the target |

## 7. Analysis and findings

1. Plastic diversion has been essentially flat. The total amount of plastic diverted nationally was 354,559 tonnes in 2018 and 364,969 tonnes in 2022, an increase of less than 3% over four years. Projecting that trend forward gives about 389,000 tonnes in 2030, which is far below the level a zero-waste target would require. (Chart: national trend, 2018 to 2022.)

2. The national recycling rate has not improved. The Environment and Climate Change Canada figures still show 9% recycled, 86% landfilled, 4% incinerated and 1% lost to the environment. Because plastic waste has continued to rise while diversion has stayed flat, the rate has not moved. (Chart: national plastic fate.)

3. Diversion is concentrated in a few provinces. In 2022, Ontario accounted for 33% of the national total and Quebec for 29%, so the two together made up 61%. Adding British Columbia brings the top three to 79%. National progress therefore depends heavily on a small number of provincial programs. (Chart: plastic diverted by province.)

4. The ranking changes when measured per person. Nova Scotia diverted the most plastic per person in 2022 at 14.5 kg, followed by Quebec at 12.1 kg and British Columbia at 11.9 kg. Ontario, which diverts the most in total, was fifth at 7.9 kg per person. Provinces that divert large totals do not necessarily divert much relative to their population. (Charts: choropleth map of diversion per person, and a scatter of total tonnes against diversion per person.)

5. Most diverted plastic comes from households. In 2022, 71% of the plastic diverted came from residential sources and 27% from non-residential sources such as businesses and institutions. Given that a large share of plastic is used in commercial and industrial settings, the non-residential stream appears to be under-collected. (Chart: residential compared with non-residential.)

6. Provinces that divert waste well tend to divert plastic well, with some exceptions. Nova Scotia performs above average on both the 2020 total-waste diversion rate and plastic diverted per person. Prince Edward Island has the highest total-waste diversion rate but only moderate plastic diversion per person, and Newfoundland and Labrador is the lowest on both measures. (Chart: total-waste diversion rate compared with plastic per person.)

## 8. Recommendation
The findings point to three actions. First, more attention should go to the non-residential stream. Households already account for 71% of diverted plastic, so the larger remaining opportunity is the commercial and industrial plastic that is currently not collected at the same rate. Extended producer responsibility programs and commercial collection are the main levers here. Second, national effort should be focused where the volumes are. Three provinces hold 79% of diversion, and Ontario is the clearest case, because it has a very large base but a low rate of diversion per person, so improvements there would move the national figure more than improvements anywhere else. Third, measurement should be improved. The Commissioner of the Environment found that progress could not be tracked reliably, so provincial diversion targets that add up to the national 2030 goal, along with more consistent reporting of what is collected, would make the target manageable.

## 9. Expected impact
The value at stake is the plastic Canada currently discards, which Environment and Climate Change Canada estimates at about $8 billion a year. Two levers account for most of the potential gain. The non-residential stream is only 27% of what is diverted today even though businesses use a large share of plastic, so collecting it closer to the residential rate would raise national volumes noticeably. Concentration is the second lever, because 79% of diverted tonnes are in three provinces, which means national progress is largely a question of programs in Ontario, Quebec and British Columbia. This report does not attach a specific dollar figure to the recoverable tonnes, because the dataset does not include plastic generation at the province level and a recovery rate cannot be calculated without it. What the data does support is that the trend is flat, the volumes are concentrated, and the least-collected stream is commercial.

## 10. Limitations
- Statistics Canada measures plastic diverted in tonnes, not a plastic-specific recycling rate. The 9% rate comes from Environment and Climate Change Canada's 2016 national study.
- The diversion table is collected every two years and is archived at 2022. Prince Edward Island and the territories are suppressed in 2022 and are excluded from that year.
- The dataset does not include plastic generation at the province level, so the report uses tonnes, per-capita figures and trend rather than a provincial rate.
- The total-waste diversion rate is from 2020 and covers all waste, so it is used only as context and not as a plastic figure.
- Population is the July estimate for each year, so per-capita figures would change slightly with a different quarter.
