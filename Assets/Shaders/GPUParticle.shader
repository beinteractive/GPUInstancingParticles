Shader "Unlit/GPUParticle"
{
	Properties
	{
	    
	}
	SubShader
	{
		Tags { "RenderType" = "Opaque" }
		LOD 100

		Pass
		{
			HLSLPROGRAM
			
			#pragma vertex vert
			#pragma fragment frag
			
			#pragma multi_compile_instancing
            #pragma instancing_options procedural:vertInstancingSetup
            
            #include "UnityCG.cginc"
            #include "UnityStandardParticleInstancing.cginc"

			struct appdata
			{
				float4 vertex : POSITION;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct v2f
			{
				float4 vertex : SV_POSITION;
			};
			
			v2f vert (appdata v)
			{
				v2f o;
				
				UNITY_SETUP_INSTANCE_ID(v);
				
				o.vertex = UnityObjectToClipPos(v.vertex);
				
				return o;
			}
			
			fixed4 frag (v2f i) : SV_Target
			{
				return fixed4(1.0, 1.0, 1.0, 1.0);
			}
			
			ENDHLSL
		}
	}
}
