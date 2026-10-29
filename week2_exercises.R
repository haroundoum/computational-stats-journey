# ============================================================
# Phase 0 - Week 2 / Semaine 2: tidyverse, missing data, Quarto
# Rules / Règles: type everything yourself; commit + push when done.
# NOTE: I could not run R on my side, so run each line and tell me
#       if something differs from EXPECTED.
# ============================================================

# Setup (once): install.packages("tidyverse")
library(tidyverse)
set.seed(2026)

# The dataset (10 farms, 3 missing values). Copy this block as-is.
farms <- tibble(
  farm_id       = paste0("F", sprintf("%02d", 1:10)),
  district      = c("Bugesera","Bugesera","Kayonza","Kayonza","Huye",
                    "Huye","Musanze","Musanze","Gasabo","Gasabo"),
  crop          = c("Maize","Beans","Maize","Rice","Maize",
                    "Beans","Rice","Maize","Beans","Rice"),
  area_ha       = c(1.2, 0.8, 2.0, 1.5, 1.0, 1.3, 1.1, 2.2, 0.9, 1.6),
  yield_tons    = c(3.5, 1.4, 5.8, 4.2, NA, 3.9, 3.0, 6.1, NA, 4.4),
  fertilizer_kg = c(100, 80, 150, 120, 90, 110, NA, 160, 70, 130)
)

# ---- Task 1: inspect / inspecter -------------------------------------
# Use glimpse(), summary(), and colSums(is.na(farms)).
# EXPECTED: 10 rows, 6 columns | NA: yield_tons = 2, fertilizer_kg = 1

# ---- Task 2: first dplyr chain / première chaîne dplyr --------------
# With the pipe %>% : keep farms with area_ha > 1, select farm_id, district,
# area_ha, then arrange by area_ha descending.
# (Check by hand: which farms have area_ha > 1?)

# ---- Task 3: group_by + summarise / statistiques par groupe ----------
# Mean yield_tons per district, ignoring NA (na.rm = TRUE).
# EXPECTED: Bugesera 2.45 | Kayonza 5.00 | Huye 3.90 | Musanze 4.55 | Gasabo 4.40
# Then the same per crop.
# EXPECTED: Maize 5.133 | Beans 2.65 | Rice 3.867

# ---- Task 4: mutate / créer des variables ---------------------------
# Add yield_per_ha = yield_tons / area_ha, and size_class using case_when():
# "Large" if area_ha > 1.5, "Medium" if area_ha > 1, else "Small".
# EXPECTED: yield_per_ha for F03 = 2.9 (5.8 / 2.0)

# ---- Task 5: missing data, the key lesson / données manquantes -----
# (a) How many rows are complete? Use farms %>% drop_na() %>% nrow()
#     EXPECTED: 7
# (b) Mean yield: all non-missing values. EXPECTED: 4.0375 (median 4.05)
# (c) Impute missing yield_tons with the overall MEDIAN using
#     mutate() and replace_na(). EXPECTED for F05 and F09: 4.05
# (d) QUESTION (write 3 lines in a comment): the two missing yields are on
#     farms F05 (Huye) and F09 (Gasabo). Is it safe to just fill with the
#     median? What could make this missingness NON-random? Compare with the
#     lecturer's rural/urban earnings example.

# ---- Task 6: join / jointure ---------------------------------------
# Create a small table prices with columns crop and price_per_ton
# (Maize 280, Beans 450, Rice 520 - invented numbers). Use left_join() to
# add price_per_ton to farms, then compute revenue = yield_tons * price_per_ton.

# ---- Task 7: your first Quarto report / premier rapport Quarto ----
# In RStudio: File > New File > Quarto Document, title "Week 2 report".
# Include: one paragraph of text, one code chunk with Task 3, one table.
# Click Render. Save the .qmd, commit and push BOTH the .qmd and the output.
