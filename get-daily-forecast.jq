map(if has("status") and has("detail") then error(.detail) else . end) |
.[0].geometry as $location | 
.[0].properties.relativeLocation as $relativeLocation |
.[1].properties.elevation as $relativeElevation |
.[1].properties.updated as $updated | 
.[1].properties.forecastGenerator as $forecastGenerator |
.[1].properties.periods as $forecasts |
{
    location: $location,
    relativeLocation: ($relativeLocation + {elevation: $relativeElevation}),
    updated: $updated,
    forecastGenerator: $forecastGenerator,
    forecast: $forecasts[0:2]
}