Shader "UI/Mask"
{
    Properties
    {
        _MaskTex("Mask Texture", 2D) = "white" {}
    }

    SubShader
    {
        Tags
        { 
            "Queue"="Transparent" 
            "IgnoreProjector"="True" 
            "RenderType"="TransparentCutout" 
            "PreviewType"="Plane"
            "CanUseSpriteAtlas"="True"
        }

        Cull Off
        Lighting Off
        ZWrite Off
        ZTest [unity_GUIZTestMode]
        Blend SrcAlpha OneMinusSrcAlpha

        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            #include "UnityCG.cginc"
            #include "UnityUI.cginc"

            sampler2D _MaskTex;

            struct appdata_t
            {
                half4 vertex   : POSITION;
                half4 color    : COLOR;
                half2 texcoord : TEXCOORD0;
            };

            struct v2f
            {
                half4 vertex   : SV_POSITION;
                half4 color    : COLOR;
                half2 texcoord  : TEXCOORD0;
                half4 worldPosition : TEXCOORD1;
            };

            v2f vert(appdata_t IN)
            {
                v2f OUT;
                OUT.worldPosition = IN.vertex;
                OUT.vertex = UnityObjectToClipPos(OUT.worldPosition);
                OUT.texcoord = IN.texcoord;
                OUT.color = IN.color;
                return OUT;
            }

            fixed4 frag(v2f IN) : SV_Target
            {
                half4 col = fixed4(0, 0, 0, 1);
                half mask = tex2D(_MaskTex, IN.texcoord).a;
                half alpha = mask - (-1 + IN.color * 2);
                col.a *= alpha;
                return col;
            }
            ENDCG
        }
    }
}