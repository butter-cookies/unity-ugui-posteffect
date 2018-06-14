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
    o.uvgrab = ComputeGrabScreenPos(o.vertex);
    o.color = v.color;
    return o;
}

half4 mosaic(v2f i) : SV_Target
{
    half block = _Size * (1 - i.color.a);
    half size = 1.0 / block;
    half2 lb = floor(i.uvgrab * block) / block;
    half2 lt = lb + half2(0.0, size);
    half2 rb = lb + half2(size, 0.0);
    half2 rt = lb + half2(size, size);
    return (tex2D(_GrabTexture, lb) + tex2D(_GrabTexture, lt) + tex2D(_GrabTexture, rb) + tex2D(_GrabTexture, rt)) / 4.0;
}
