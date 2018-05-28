struct appdata_t
{
    half4 vertex : POSITION;
    half2 uv : TEXCOORD0;
    half4 color : COLOR;
};

struct v2f
{
    half4 vertex : POSITION;
    half4 uvgrab : TEXCOORD0;
    half4 color : COLOR;
};

half _Size;
sampler2D _GrabTexture;
half4 _GrabTexture_TexelSize;

v2f vert(appdata_t v)
{
    v2f o;
    o.vertex = UnityObjectToClipPos(v.vertex);
    #if UNITY_UV_STARTS_AT_TOP
    float scale = -1.0;
    #else
    float scale = 1.0;
    #endif
    o.uvgrab.xy = (half2(o.vertex.x, o.vertex.y * scale) + o.vertex.w) * 0.5;
    o.uvgrab.zw = o.vertex.zw;
    o.color = v.color;
    return o;
}

half4 blurX(v2f i) : SV_Target
{
    half4 col = 0;
    #define BlurX(weight, kernelx) tex2Dproj( _GrabTexture, UNITY_PROJ_COORD(half4(i.uvgrab.x + _GrabTexture_TexelSize.x * kernelx * _Size * i.color.a, i.uvgrab.y, i.uvgrab.z, i.uvgrab.w))) * weight
    col += BlurX(0.05, -4.0);
    col += BlurX(0.09, -3.0);
    col += BlurX(0.12, -2.0);
    col += BlurX(0.15, -1.0);
    col += BlurX(0.18,  0.0);
    col += BlurX(0.15, +1.0);
    col += BlurX(0.12, +2.0);
    col += BlurX(0.09, +3.0);
    col += BlurX(0.05, +4.0);
    return col;
}

half4 blurY(v2f i) : SV_Target
{
    half4 col = 0;
    #define BlurY(weight, kernely) tex2Dproj( _GrabTexture, UNITY_PROJ_COORD(half4(i.uvgrab.x, i.uvgrab.y + _GrabTexture_TexelSize.y * kernely * _Size * i.color.a, i.uvgrab.z, i.uvgrab.w))) * weight
    col += BlurY(0.05, -4.0);
    col += BlurY(0.09, -3.0);
    col += BlurY(0.12, -2.0);
    col += BlurY(0.15, -1.0);
    col += BlurY(0.18,  0.0);
    col += BlurY(0.15, +1.0);
    col += BlurY(0.12, +2.0);
    col += BlurY(0.09, +3.0);
    col += BlurY(0.05, +4.0);
    col.rgb *= i.color.rgb;
    return col;
}
