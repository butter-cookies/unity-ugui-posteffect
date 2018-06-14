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

sampler2D _GrabTexture;
half4 _GrabTexture_TexelSize;

v2f vert(appdata_t v)
{
    v2f o;
    o.vertex = UnityObjectToClipPos(v.vertex);
    o.uvgrab = ComputeGrabScreenPos(o.vertex);
    o.color = v.color;
    return o;
}

half4 sepia(v2f i) : SV_Target
{
    half3 c = tex2D(_GrabTexture, i.uvgrab.xy).rgb;
    half g = c.r * i.color.r + c.g * i.color.g + c.b * i.color.b;
    return half4(half3(g, g, g) * (half3(1.07, 0.74, 0.43) * i.color.a), 1);
}
