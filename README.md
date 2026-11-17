# 大秘寶挖掘中｜任期大冒險

純靜態 HTML5 Canvas 小遊戲，無需 Node.js 或建置步驟。外部字型使用 Google Fonts，離線時會退回系統字型。

## Docker

```sh
docker build -t term-dig-game .
docker run --rm -p 8080:80 term-dig-game
```

開啟 http://localhost:8080

## 本機預覽

```sh
python3 -m http.server 8080 --directory dist
```

遊戲不需要環境變數；畫面與遊戲狀態都由瀏覽器端執行。
