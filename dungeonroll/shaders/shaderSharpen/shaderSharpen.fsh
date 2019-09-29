//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

const float smoothing = 0.2;

void main()
{
    vec4 gmtexture = texture2D(gm_BaseTexture, v_vTexcoord);
    float alpha = smoothstep(0.5 - smoothing, 0.5 + smoothing, gmtexture.a);
	
    gl_FragColor = vec4(gmtexture.rgb, alpha * v_vColour.a);
}

