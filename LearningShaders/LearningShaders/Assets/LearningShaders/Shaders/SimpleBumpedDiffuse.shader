Shader "Jay/SimpleBumpedDiffuse"
{
    Properties
    {
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        _Bump ("Bump", 2D) = "bump" {}
        _BumpIntensity ("Bump Intensity", Range(0,10)) = 1
        //_MainTex ("Albedo (RGB)", 2D) = "white" {}
        //_Glossiness ("Smoothness", Range(0,1)) = 0.5
        //_Metallic ("Metallic", Range(0,1)) = 0.0 
    }
    SubShader
    {
        CGPROGRAM

        #pragma surface surf Lambert

        sampler2D _MainTex;
        sampler2D _Bump;
        half _BumpIntensity;
    
        struct Input
        {
            float2 uv_Tex;      //any uv structure needs to start with uv or uv2 they repsresent the uvset 1 or 2 
            float2 uv_Bump;
        };


        void surf (Input IN, inout SurfaceOutput o)
        {
            // multiply does the same as multiply in photoshop 0 is black and max is almost white. 
            o.Albedo = tex2D(_MainTex, IN.uv_Tex).rgb;
            o.Normal = UnpackNormal(tex2D(_Bump, IN.uv_Bump));
            // The bump intensity is applied here 
            o.Normal *= float3(_BumpIntensity, _BumpIntensity, 1);
        }

        ENDCG
    }

    FallBack "Diffuse"
}
