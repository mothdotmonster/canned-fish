-- monkeypatch to ensure used cans are recycled properly
table.insert(data.raw["technology"]["recycling"].effects, { type = "unlock-recipe", recipe = "used-can-recycling" })