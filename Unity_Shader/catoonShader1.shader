// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:32419,y:32312,varname:node_9361,prsc:2|custl-7021-OUT,olwid-8039-OUT,olcol-9143-RGB;n:type:ShaderForge.SFN_NormalVector,id:4915,x:31248,y:32337,prsc:2,pt:False;n:type:ShaderForge.SFN_LightAttenuation,id:9644,x:31439,y:32607,varname:node_9644,prsc:2;n:type:ShaderForge.SFN_LightVector,id:2967,x:31264,y:32505,varname:node_2967,prsc:2;n:type:ShaderForge.SFN_Dot,id:3029,x:31507,y:32405,varname:node_3029,prsc:2,dt:1|A-4915-OUT,B-2967-OUT;n:type:ShaderForge.SFN_Tex2d,id:759,x:32085,y:32533,ptovrint:False,ptlb:node_759,ptin:_node_759,varname:node_759,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:e5433aafad9441c4998914efc0d20948,ntxv:3,isnm:False|UVIN-4890-OUT;n:type:ShaderForge.SFN_Append,id:4890,x:31887,y:32420,varname:node_4890,prsc:2|A-9029-OUT,B-9029-OUT;n:type:ShaderForge.SFN_Multiply,id:9029,x:31703,y:32499,varname:node_9029,prsc:2|A-3029-OUT,B-9644-OUT;n:type:ShaderForge.SFN_Slider,id:8039,x:31671,y:32686,ptovrint:False,ptlb:node_8039,ptin:_node_8039,varname:node_8039,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:0.1;n:type:ShaderForge.SFN_Color,id:9143,x:31797,y:32773,ptovrint:False,ptlb:node_9143,ptin:_node_9143,varname:node_9143,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:0.8482759,c3:0,c4:1;n:type:ShaderForge.SFN_HalfVector,id:2320,x:31248,y:32169,varname:node_2320,prsc:2;n:type:ShaderForge.SFN_Dot,id:9711,x:31518,y:32228,varname:node_9711,prsc:2,dt:0|A-2320-OUT,B-4915-OUT;n:type:ShaderForge.SFN_Append,id:1298,x:31717,y:32214,varname:node_1298,prsc:2|A-9711-OUT,B-9711-OUT;n:type:ShaderForge.SFN_Tex2d,id:148,x:31955,y:32197,ptovrint:False,ptlb:node_148,ptin:_node_148,varname:node_148,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:836f6f6e2ef5cd34a969b8c52d47a49e,ntxv:0,isnm:False|UVIN-1298-OUT;n:type:ShaderForge.SFN_Add,id:7021,x:32202,y:32253,varname:node_7021,prsc:2|A-148-RGB,B-759-RGB;proporder:759-8039-9143-148;pass:END;sub:END;*/

Shader "Shader Forge/catoonShader1" {
    Properties {
        _node_759 ("node_759", 2D) = "bump" {}
        _node_8039 ("node_8039", Range(0, 0.1)) = 0
        _node_9143 ("node_9143", Color) = (1,0.8482759,0,1)
        _node_148 ("node_148", 2D) = "white" {}
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
        }
        Pass {
            Name "Outline"
            Tags {
            }
            Cull Front
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform float _node_8039;
            uniform float4 _node_9143;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                UNITY_FOG_COORDS(0)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.pos = UnityObjectToClipPos( float4(v.vertex.xyz + v.normal*_node_8039,1) );
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                return fixed4(_node_9143.rgb,0);
            }
            ENDCG
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
            uniform sampler2D _node_759; uniform float4 _node_759_ST;
            uniform sampler2D _node_148; uniform float4 _node_148_ST;
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
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float node_9711 = dot(halfDirection,i.normalDir);
                float2 node_1298 = float2(node_9711,node_9711);
                float4 _node_148_var = tex2D(_node_148,TRANSFORM_TEX(node_1298, _node_148));
                float node_9029 = (max(0,dot(i.normalDir,lightDirection))*attenuation);
                float2 node_4890 = float2(node_9029,node_9029);
                float4 _node_759_var = tex2D(_node_759,TRANSFORM_TEX(node_4890, _node_759));
                float3 finalColor = (_node_148_var.rgb+_node_759_var.rgb);
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
            uniform sampler2D _node_759; uniform float4 _node_759_ST;
            uniform sampler2D _node_148; uniform float4 _node_148_ST;
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
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float node_9711 = dot(halfDirection,i.normalDir);
                float2 node_1298 = float2(node_9711,node_9711);
                float4 _node_148_var = tex2D(_node_148,TRANSFORM_TEX(node_1298, _node_148));
                float node_9029 = (max(0,dot(i.normalDir,lightDirection))*attenuation);
                float2 node_4890 = float2(node_9029,node_9029);
                float4 _node_759_var = tex2D(_node_759,TRANSFORM_TEX(node_4890, _node_759));
                float3 finalColor = (_node_148_var.rgb+_node_759_var.rgb);
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
