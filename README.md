# FiveM Vehicle Speed Limit Script
This script is designed for FiveM servers running the qb-core framework, allowing server admins to define and enforce speed limits based on both vehicle categories and individual vehicle models. The script applies speed limits dynamically when players enter a vehicle, ensuring that each vehicle has a maximum speed that respects either a category-wide limit or a model-specific limit, depending on the configuration.

Key Features:

Category-Based Speed Limits: Vehicles are grouped by category (e.g., compacts, sports, super) and assigned corresponding speed limits. These limits are configurable for both kilometers per hour (KMH) and miles per hour (MPH).

Model-Specific Speed Limits: In addition to category limits, the script allows you to define unique speed limits for specific vehicle models (e.g., Adder, Kuruma, Sultan). This gives server admins fine-grained control over individual vehicle performance.

Dynamic Speed Application: When a player enters a vehicle, the script checks for a specific speed limit for that model. If no model-specific limit is found, it will use the vehicle’s category to apply the appropriate speed limit.

Conversion Factor for MPH and KMH: The script allows configuration for either MPH or KMH as the measurement unit. Speed limits are automatically converted from the chosen unit to meters per second using a configurable conversion factor, ensuring accurate in-game speed enforcement.

Player Notifications: Upon entering a vehicle, players are notified of the speed limit applied to their vehicle, either in KMH or MPH, depending on the server settings. can be removed for cleaner look
