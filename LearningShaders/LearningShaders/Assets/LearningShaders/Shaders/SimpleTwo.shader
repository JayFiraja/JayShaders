Shader "Jay/SimpleTwo"
{
    Properties
    {
        _Color ("Color", Color) = (1,1,1,1)
        _Range ("Range", Range(0,5)) = 1
        _Tex ("Texture", 2D) = "white" {}
        _myCube ("Cubemap", CUBE) =""{}
        _Float ("Float", Float) = 0.5
        _Vector ("Vector", Vector) = (0.5,1,1,1) 
        //_MainTex ("Albedo (RGB)", 2D) = "white" {}
        //_Glossiness ("Smoothness", Range(0,1)) = 0.5
        //_Metallic ("Metallic", Range(0,1)) = 0.0 
    }
    SubShader
    {
        CGPROGRAM

        #pragma surface surf Lambert

        fixed4 _Color;
        half _Range;
        sampler2D _Tex;
        samplerCUBE _myCube;
        float _Float;
        float4 _Vector;


        struct Input
        {
            float2 uv_Tex;      //any uv structure needs to start with uv or uv2 they repsresent the uvset 1 or 2 
            float3 worldRefl;
        };


        void surf (Input IN, inout SurfaceOutput o)
        {
            // multiply does the same as multiply in photoshop 0 is black and max is almost white. 
            o.Albedo = (tex2D(_Tex, IN.uv_Tex) * _Range).rgb;
            o.Emission = texCUBE (_myCube, IN.worldRefl).rgb;
        }

        ENDCG
    }

    FallBack "Diffuse"
}
