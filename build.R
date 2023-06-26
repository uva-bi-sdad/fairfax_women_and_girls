library(community)

entity_info = jsonlite::read_json("../fairfax_women_and_girls/docs/data/entity_info.json")
#entity_info$zip_code <- lapply(entity_info$zip_code, function(l) {l$county = "51059"; l})
jsonlite::write_json(entity_info, "../fairfax_women_and_girls/docs/data/entity_info.json", auto_unbox = TRUE)

data_add(
  c(
    county = "county.csv.xz",
    tract = "tract.csv.xz",
    block_group = "block_group.csv.xz",
    "human_services_region" = "human_services_region.csv.xz",
    "planning_district" = "planning_district.csv.xz",
    "supervisor_district" = "supervisor_district.csv.xz"#,
#    "zip_code" = "zip_code.csv.xz"
  ),
  list(
    ids = list(
      variable = "ID",
      map = paste0(
        "https://raw.githubusercontent.com/uva-bi-sdad/sdc.geographies/main/",
        "entities/data/distribution/NCR.json"
      )
    ),
    time = "time",
    variables = "measure_info.json"
  ),
  dir = "../fairfax_women_and_girls/docs/data",
  clean = TRUE
)

site_build(
  "../fairfax_women_and_girls")
