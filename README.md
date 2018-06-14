# unity-ugui-posteffect
it's unity's ui posteffect shader repository.

## Introduction

uGUIで画面エフェクトを入れるためのシェーダーです。<br>
ブラーやモザイクや歪みといった画面効果を簡単に差し込むことができます。

<img src="https://github.com/gon-siege/unity-ugui-posteffect/blob/master/Sample/Sample.png" >

### Scene

> Filter

フィルターのマテリアルを入れ替えることで画面効果を切り替えることができます。<br>
Filterより前に描画された画面に画面効果を与えます。<br>

> Image2

今回の場合、「Filter」より先に描画されるので、画面効果の影響を受けます。

> Image1

今回の場合、「Filter」より後に描画されるので、画面効果の影響を受けません。

## Example

画面効果の一覧です。

> ブラー

<img src="https://github.com/gon-siege/unity-ugui-posteffect/blob/master/Sample/Blur/BlurScreenShot.png" width="420">

https://github.com/gon-siege/unity-ugui-posteffect/tree/master/Assets/Shader/Blur

> マスク

<img src="https://github.com/gon-siege/unity-ugui-posteffect/blob/master/Sample/Mask/Mask01ScreenShot.png" width="420">

https://github.com/gon-siege/unity-ugui-posteffect/tree/master/Assets/Shader/Mask

> モノクロ

<img src="https://github.com/gon-siege/unity-ugui-posteffect/blob/master/Sample/Monochrome/MonochromeScreenShot.png" width="420">

https://github.com/gon-siege/unity-ugui-posteffect/tree/master/Assets/Shader/Monochrome

> モザイク

<img src="https://github.com/gon-siege/unity-ugui-posteffect/blob/master/Sample/Mosaic/MosaicScreenShot.png" width="420">

https://github.com/gon-siege/unity-ugui-posteffect/tree/master/Assets/Shader/Mosaic

> パルスノイズ

<img src="https://github.com/gon-siege/unity-ugui-posteffect/blob/master/Sample/PlusNoise/PlusNoiseXScreenShot.png" width="420"><img src="https://github.com/gon-siege/unity-ugui-posteffect/blob/master/Sample/PlusNoise/PlusNoiseYScreenShot.png" width="420">

https://github.com/gon-siege/unity-ugui-posteffect/tree/master/Assets/Shader/PlusNoise

> 砂嵐

<img src="https://github.com/gon-siege/unity-ugui-posteffect/blob/master/Sample/SandStorm/SandStormScreenShot.png" width="420">

https://github.com/gon-siege/unity-ugui-posteffect/tree/master/Assets/Shader/SandStorm

> セピア

<img src="https://github.com/gon-siege/unity-ugui-posteffect/blob/master/Sample/Sepia/SepiaScreenShot.png" width="420">

https://github.com/gon-siege/unity-ugui-posteffect/tree/master/Assets/Shader/Sepia
