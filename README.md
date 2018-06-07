# unity-ugui-posteffect
it's unity's ui posteffect shader repository.

> 概要

uGUIで画面エフェクトを入れるためのシェーダーです。<br>
ブラーやモザイクや歪みといった画面効果を簡単に差し込むことができます。

> ブラー

<img src="https://github.com/gon-siege/unity-ugui-posteffect/blob/master/Assets/Sample/Blur/BlurScreenShot.png" width="420">

画面をぼやかします。
カラーのAlphaをぼかし度に割り当てているため、徐々にぼけていくといったアニメーションを作ることもできます。

> マスク

<img src="https://github.com/gon-siege/unity-ugui-posteffect/blob/master/Assets/Sample/Mask/Mask01ScreenShot.png" width="420">

マスク画像を画面に加算します。
カラーのRを加算度に割り当てているので、徐々に画面が隠れていくといったアニメーションを作ることもできます。
また、テクスチャを差し替えることで様々なフェードイン/アウトの演出を作ることができます。

> モノクロ

<img src="https://github.com/gon-siege/unity-ugui-posteffect/blob/master/Assets/Sample/Monochrome/MonochromeScreenShot.png" width="420">

画面をモノクロにします。
カラーのRGBを計算に使っているので、微妙な明るさの調整ができます。

> モノクロ

<img src="https://github.com/gon-siege/unity-ugui-posteffect/blob/master/Assets/Sample/Monochrome/MonochromeScreenShot.png" width="420">

画面をモノクロにします。
カラーのRGBを計算に使っているので、微妙な明るさの調整ができます。

> モザイク

<img src="https://github.com/gon-siege/unity-ugui-posteffect/blob/master/Assets/Sample/Mosaic/MosaicScreenShot.png" width="420">

画面にモザイクをかけます。
カラーのAとマテリアルのパラメータを調整することで、モザイクの粒度を調整できます。

> パルスノイズ

<img src="https://github.com/gon-siege/unity-ugui-posteffect/blob/master/Assets/Sample/PlusNoise/PlusNoiseXScreenShot.png" width="420"><img src="https://github.com/gon-siege/unity-ugui-posteffect/blob/master/Assets/Sample/PlusNoise/PlusNoiseYScreenShot.png" width="420">

画面を歪ませます。
カラーのAを調整することで、歪みを調整できます。

> 砂嵐

<img src="https://github.com/gon-siege/unity-ugui-posteffect/blob/master/Assets/Sample/SandStorm/SandStormScreenShot.png" width="420">

画面に砂嵐を表示します。

> セピア

<img src="https://github.com/gon-siege/unity-ugui-posteffect/blob/master/Assets/Sample/Sepia/SepiaScreenShot.png" width="420">

カラーのRGBAを調整することで、セピアの結果を調整できます。
