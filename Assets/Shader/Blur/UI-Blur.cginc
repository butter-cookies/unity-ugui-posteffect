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

half4 blur(v2f i, half w, half kx, half ky)
{
    return tex2Dproj( _GrabTexture, UNITY_PROJ_COORD(half4(i.uvgrab.x + _GrabTexture_TexelSize.x * kx * _Size * i.color.a, i.uvgrab.y + _GrabTexture_TexelSize.y * ky * _Size * i.color.a, i.uvgrab.z, i.uvgrab.w))) * w;
} 

half4 blurX(v2f i) : SV_Target
{
    half4 col = 0;
    col += blur(i, 0.05, -4.0, 0.0);
    col += blur(i, 0.09, -3.0, 0.0);
    col += blur(i, 0.12, -2.0, 0.0);
    col += blur(i, 0.15, -1.0, 0.0);
    col += blur(i, 0.18,  0.0, 0.0);
    col += blur(i, 0.15, +1.0, 0.0);
    col += blur(i, 0.12, +2.0, 0.0);
    col += blur(i, 0.09, +3.0, 0.0);
    col += blur(i, 0.05, +4.0, 0.0);
    return col;
}

half4 blurY(v2f i) : SV_Target
{
    half4 col = 0;
    col += blur(i, 0.05, 0.0, -4.0);
    col += blur(i, 0.09, 0.0, -3.0);
    col += blur(i, 0.12, 0.0, -2.0);
    col += blur(i, 0.15, 0.0, -1.0);
    col += blur(i, 0.18, 0.0,  0.0);
    col += blur(i, 0.15, 0.0, +1.0);
    col += blur(i, 0.12, 0.0, +2.0);
    col += blur(i, 0.09, 0.0, +3.0);
    col += blur(i, 0.05, 0.0, +4.0);
    col.rgb *= i.color.rgb;
    return col;
}
