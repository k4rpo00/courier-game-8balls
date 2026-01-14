varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float u_mode;

void main() {
    vec4 col = texture2D(gm_BaseTexture, v_vTexcoord);

   

    if (u_mode < 0.5) {
        gl_FragColor = col;
        return;
    }

    vec3 c = col.rgb;
    vec3 o = c;

    if (u_mode < 1.5) { 
        o.r = 0.567*c.r + 0.433*c.g;
        o.g = 0.558*c.r + 0.442*c.g;
        o.b = 0.242*c.g + 0.758*c.b;
    }
    else if (u_mode < 2.5) { 
        o.r = 0.625*c.r + 0.375*c.g;
        o.g = 0.700*c.r + 0.300*c.g;
        o.b = 0.300*c.g + 0.700*c.b;
    }
    else { 
        o.r = 0.950*c.r + 0.050*c.g;
        o.g = 0.433*c.g + 0.567*c.b;
        o.b = 0.475*c.g + 0.525*c.b;
    }

    gl_FragColor = vec4(o, col.a);
}
