// Jay is folder or section, and SimpleOne is the shader name
Shader "Jay/SimpleOne"
{
    // This will be displayed in the Inspector
    Properties
    {
        // property name, display name, and default value
        _myColour ("My Colour", Color) = (1,1,1,1)
        _myEmmisive ("My Emmisive", Color) = (0,0,0,0)  
    }

    SubShader
    {
        // Here is the processing
        CGPROGRAM
            // surface is type of shader
            // surf is name of the shader function
            // Lambert is type of lighting or lighting model
            #pragma surface surf Lambert

            struct Input
            {
                // float2 is shader data type for 2 floats. 
                float2 uvMainTex;
            };

            // array of 4 floats
            fixed4 _myColour;
            fixed4 _myEmmisive;

            // "Input" data structure is used here
            void surf (Input IN, inout SurfaceOutput o)
            {
                o.Albedo = _myColour.rgb;
                o.Emission = _myEmmisive.rgb;
            }

        ENDCG
    }


    //Secure rendering for inferior GPUs shader fallsback to the specified shader name here
    FallBack "Diffuse"

}
