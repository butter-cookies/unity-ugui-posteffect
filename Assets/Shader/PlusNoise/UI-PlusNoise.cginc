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

half4 plusnoiseX(v2f i) : SV_Target
{
    half2 uv = i.uvgrab;
    half x = 2 * uv.y;
    uv.x += _Size * i.color.a * sin(10 * x) * (-(x - 1) * (x - 1) + 1);
    return tex2D(_GrabTexture, uv);
}

half4 plusnoiseY(v2f i) : SV_Target
{
    half2 uv = i.uvgrab;
    half y = 2 * uv.x;
    uv.y += _Size * i.color.a * sin(10 * y) * (-(y - 1) * (y - 1) + 1);
    return tex2D(_GrabTexture, uv);
}
