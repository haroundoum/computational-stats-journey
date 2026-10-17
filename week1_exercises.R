# ============================================================
# Phase 0 - Week 1 / Phase 0 - Semaine 1
# Harouna Doumbia - Computational Statistics, Excellence Track
# Goal / But: type each task yourself, run it, compare with EXPECTED.
#             Tape chaque tâche toi-même, exécute, compare avec EXPECTED.
# Rule / Règle: do NOT copy-paste the answers. Write, run, break, fix.
# ============================================================

set.seed(2026)   # reproducibility / reproductibilité

# ---- Task 1: vectors / vecteurs -------------------------------------------
# yield_kg <- c(2.5, 3.8, 1.9, 4.2)
# Compute mean, median, standard deviation.
# EXPECTED: mean 3.1 | median 3.15 | sd 1.0801

# ---- Task 2: your first function / ta première fonction ---------------------
# Write quad_roots(a, b, c) that returns the two roots of ax^2 + bx + c = 0.
# Return NA with a message if the discriminant is negative.
# EXPECTED: quad_roots(1, -3, -6) -> 4.3723 and -1.3723
#           quad_roots(1, -1, -6) -> 3 and -2   (the lecturer's example)

# ---- Task 3: a loop / une boucle ---------------------------------------------
# With a for loop, sum all integers from 1 to 100 divisible by 3 or 5.
# Then do the same WITHOUT a loop (hint: x[x %% 3 == 0 | x %% 5 == 0]).
# EXPECTED: 2418 both ways

# ---- Task 4: data frame / data frame -----------------------------------------
# Build a data frame of 6 farms: farm_id, district, area_ha, yield_kg, irrigated.
# Then: (a) mean yield per irrigated TRUE/FALSE using tapply() or aggregate(),
#       (b) add a column yield_per_ha = yield_kg / area_ha,
#       (c) sort the farms from best to worst yield_per_ha.
# No fixed EXPECTED: invent the numbers, check the arithmetic by hand once.

# ---- Task 5: first simulation (preview of Phase 1) -----------------------
# Simulate 10000 dice rolls with sample(1:6, 10000, replace = TRUE).
# Estimate P(roll == 6) as the proportion of sixes.
# EXPECTED: close to 1/6 = 0.1667 (not exactly: that is Monte Carlo error).
# Then repeat with 100, 1000, 100000 rolls. What happens to the error?

# ---- Task 6: reflection / réflexion (write 3 lines in a comment) ----------
# Which task was hardest, what error message did you hit, how did you fix it?
