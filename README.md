# README

## Launching app locally

```bash
docker-compose up
```

## Structure of the project

* `ui` contains controllers and serializers
* `data` contains repositories and data source
* `app` contains buisness logick

## Note

Requirements stated that i need to implement following endpoints:

- /api/heros - hero list
- /api/heros/{hero_id} - hero data
- /api/heros/{hero_id}/abilities - hero ability list
- /api/abilities/ - ability list
- /api/abilities/{ability_id} - ability data

I assumed that there must be typo and slightly changed endpoints:

- /api/v1/heroes - hero list
- /api/v1/heroes/{hero_id} - hero data
- /api/v1/heroes/{hero_id}/abilities - hero ability list
- /api/v1/abilities/ - ability list
- /api/v1/abilities/{ability_id} - ability data
