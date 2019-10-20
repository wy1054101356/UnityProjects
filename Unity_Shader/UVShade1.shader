// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33168,y:32605,varname:node_9361,prsc:2|custl-197-OUT;n:type:ShaderForge.SFN_Time,id:3415,x:32332,y:32560,varname:node_3415,prsc:2;n:type:ShaderForge.SFN_Slider,id:5257,x:32161,y:32798,ptovrint:False,ptlb:node_5257,ptin:_node_5257,varname:node_5257,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:2.839211,max:5;n:type:ShaderForge.SFN_Multiply,id:1520,x:32527,y:32728,varname:node_1520,prsc:2|A-3415-T,B-5257-OUT;n:type:ShaderForge.SFN_Sin,id:2608,x:32718,y:32728,varname:node_2608,prsc:2|IN-1520-OUT;n:type:ShaderForge.SFN_Color,id:8461,x:32636,y:32529,ptovrint:False,ptlb:node_8461,ptin:_node_8461,varname:node_8461,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:0,c3:0,c4:1;n:type:ShaderForge.SFN_Multiply,id:197,x:32903,y:32607,varname:node_197,prsc:2|A-8461-RGB,B-2608-OUT;n:type:ShaderForge.SFN_TexCoord,id:3159,x:32541,y:33131,varname:node_3159,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Tex2d,id:5909,x:32318,y:32924,ptovrint:False,ptlb:node_5909,ptin:_node_5909,varname:node_5909,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:b2ecbaaf7bc7a8f48a261789a78f6dc1,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:4359,x:32318,y:33112,ptovrint:False,ptlb:node_5909_copy,ptin:_node_5909_copy,varname:_node_5909_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:368ae7a4a48bf304da34b03bb6172a8c,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Append,id:7471,x:32541,y:32969,varname:node_7471,prsc:2|A-5909-R,B-4359-R;proporder:5257-8461;pass:END;sub:END;*/

Shader "Shader Forge/UVShade1" {
    Properties {
        _node_5257 ("node_5257", Range(0, 5)) = 2.839211
        _node_8461 ("node_8461", Color) = (1,0,0,1)
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
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform float _node_5257;
            uniform float4 _node_8461;
            struct VertexInput {
                float4 vertex : POSITION;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                UNITY_FOG_COORDS(0)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
////// Lighting:
                float4 node_3415 = _Time;
                float3 finalColor = (_node_8461.rgb*sin((node_3415.g*_node_5257)));
                fixed4 finalRGBA = fixed4(finalColor,1);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
