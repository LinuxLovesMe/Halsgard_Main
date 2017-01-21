//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 colour = texture2D(gm_BaseTexture, v_vTexcoord);
    //float intensity = 0.299 * colour.r + 0.587 * colour.g + 0.184 * colour.b;
    float intensity = 0.5 * colour.r + 0.5 * colour.g + 0.5 * colour.b;
    /*colour.r = intensity + 0.195; 
    colour.g = intensity + 0.176; 
    colour.b = intensity;*/
    colour.r = 0.5; 
    colour.g = 0.5; 
    colour.b = 0.5;
    colour.a -= 0.4;
    //gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
    gl_FragColor = vec4(colour.r, colour.g, colour.b, colour.a);
}

