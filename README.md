# 大秘寶挖掘中｜任期大冒險

純靜態 HTML5 Canvas 小遊戲。遊戲不需要環境變數、Node.js 或建置步驟；Docker 會用 Nginx 提供網頁。外部字型使用 Google Fonts，離線時會退回系統字型。

## 需求

- Docker Desktop（macOS、Windows）或 Docker Engine（Linux）
- Git（若要下載專案）

## 啟動

下載專案後，在專案根目錄執行：

```sh
./scripts/start.sh
```

腳本會建置 Docker image、啟動名為 `term-dig-game` 的容器，預設在 <http://localhost:8080> 提供遊戲。

若要使用其他連接埠：

```sh
PORT=3000 ./scripts/start.sh
```

## 停止

在專案根目錄執行：

```sh
./scripts/stop.sh
```

停止腳本會停止並移除遊戲容器；下次重新啟動時再執行 `start.sh` 即可。

## 常見操作

```sh
docker logs term-dig-game       # 查看容器日誌
docker ps                      # 查看執行中的容器
```

若容器名稱已被其他服務使用，可自訂名稱；啟動與停止時需使用相同值：

```sh
CONTAINER_NAME=my-game ./scripts/start.sh
CONTAINER_NAME=my-game ./scripts/stop.sh
```
