## Index

- [Generate depth map](https://github.com/szgk/stablediffusion-practice#generate-depth-map)
  1. [BoostYourOwnDepth demo](https://github.com/szgk/stablediffusion-practice#1-boostyourowndepth-demo)
  1. [BoostingMonocularDepth demo](https://github.com/szgk/stablediffusion-practice#2-boostingmonoculardepth-demo)
-

## start

```
docker compose up
```

access localhost:8888

### enter container

```
docker compose exec app bash
```

## Generate depth map
### 1. BoostYourOwnDepth demo

#### ref
- https://github.com/compphoto/BoostYourOwnDepth
  - np.float を np.float64 に変える必要あり 

### 2. BoostingMonocularDepth demo

#### ref
- https://github.com/compphoto/BoostingMonocularDepth
  - np.float を np.float64 に変える必要あり
- https://www.12-technology.com/2022/07/mergenet.html
