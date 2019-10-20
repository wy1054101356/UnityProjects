// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33294,y:32457,varname:node_9361,prsc:2|custl-5087-OUT;n:type:ShaderForge.SFN_NormalVector,id:2198,x:32253,y:32521,prsc:2,pt:False;n:type:ShaderForge.SFN_LightVector,id:7015,x:32253,y:32703,varname:node_7015,prsc:2;n:type:ShaderForge.SFN_Dot,id:9532,x:32458,y:32521,varname:node_9532,prsc:2,dt:1|A-2198-OUT,B-7015-OUT;n:type:ShaderForge.SFN_LightAttenuation,id:583,x:32458,y:32703,varname:node_583,prsc:2;n:type:ShaderForge.SFN_Multiply,id:722,x:32644,y:32603,varname:node_722,prsc:2|A-9532-OUT,B-583-OUT;n:type:ShaderForge.SFN_Tex2d,id:5862,x:32871,y:32460,ptovrint:False,ptlb:node_5862,ptin:_node_5862,varname:node_5862,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:c4cb830f31099f74fb31c09fcd7726f3,ntxv:0,isnm:False|UVIN-6299-OUT;n:type:ShaderForge.SFN_Append,id:6299,x:32682,y:32361,varname:node_6299,prsc:2|A-722-OUT,B-9694-OUT;n:type:ShaderForge.SFN_ViewVector,id:544,x:32253,y:32341,varname:node_544,prsc:2;n:type:ShaderForge.SFN_Dot,id:7911,x:32458,y:32341,varname:node_7911,prsc:2,dt:1|A-544-OUT,B-2198-OUT;n:type:ShaderForge.SFN_Tex2d,id:6478,x:33107,y:32290,ptovrint:False,ptlb:node_6478,ptin:_node_6478,varname:node_6478,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:c07bfd8af3eb24549b6c143daf5d5c00,ntxv:0,isnm:False;n:type:ShaderForge.SFN_LightColor,id:5079,x:32644,y:32747,varname:node_5079,prsc:2;n:type:ShaderForge.SFN_Multiply,id:5087,x:32882,y:32747,varname:node_5087,prsc:2|A-5862-RGB,B-5079-RGB;n:type:ShaderForge.SFN_Power,id:9694,x:32698,y:32183,varname:node_9694,prsc:2|VAL-7911-OUT,EXP-4824-OUT;n:type:ShaderForge.SFN_Exp,id:4824,x:32458,y:32173,varname:node_4824,prsc:2,et:1|IN-5283-OUT;n:type:ShaderForge.SFN_Slider,id:5283,x:32135,y:32210,ptovrint:False,ptlb:node_5283,ptin:_node_5283,varname:node_5283,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.8734459,max:3;proporder:5862-5283;pass:END;sub:END;*/

Shader "Shader Forge/BRDFShader" {
    Properties {
        _node_5862 ("node_5862", 2D) = "white" {}
        _node_5283 ("node_5283", Range(0, 3)) = 0.8734459
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #include "Lighting.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform sampler2D _node_5862; uniform float4 _node_5862_ST;
            uniform float _node_5283;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float4 posWorld : TEXCOORD0;
                float3 normalDir : TEXCOORD1;
                LIGHTING_COORDS(2,3)
                UNITY_FOG_COORDS(4)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float2 node_6299 = float2((max(0,dot(i.normalDir,lightDirection))*attenuation),pow(max(0,dot(viewDirection,i.normalDir)),exp2(_node_5283)));
                float4 _node_5862_var = tex2D(_node_5862,TRANSFORM_TEX(node_6299, _node_5862));
                float3 finalColor = (_node_5862_var.rgb*_LightColor0.rgb);
                fixed4 finalRGBA = fixed4(finalColor,1);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
        Pass {
            Name "FORWARD_DELTA"
            Tags {
                "LightMode"="ForwardAdd"
            }
            Blend One One
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDADD
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #include "Lighting.cginc"
            #pragma multi_compile_fwdadd_fullshadows
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform sampler2D _node_5862; uniform float4 _node_5862_ST;
            uniform float _node_5283;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float4 posWorld : TEXCOORD0;
                float3 normalDir : TEXCOORD1;
                LIGHTING_COORDS(2,3)
                UNITY_FOG_COORDS(4)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float2 node_6299 = float2((max(0,dot(i.normalDir,lightDirection))*attenuation),pow(max(0,dot(viewDirection,i.normalDir)),exp2(_node_5283)));
                float4 _node_5862_var = tex2D(_node_5862,TRANSFORM_TEX(node_6299, _node_5862));
                float3 finalColor = (_node_5862_var.rgb*_LightColor0.rgb);
                fixed4 finalRGBA = fixed4(finalColor * 1,0);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
