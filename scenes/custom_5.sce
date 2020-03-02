sce1.0

# camera
eyepos 750 75 150
eyedir -0.2 1.0 0.3
eyeup  0.0 0.0 1.0
wdist  20.0
fovy_deg 70

nx 640
ny 320

#options

max_recursion 10
aasample 20
                
# scene

ca 0.1 0.1 0.1

background 0 0 0

{
        # cylinder cube frame around bottom plane
        cr 0.8 0.0 0.8
        cp 0.1 0.0 0.1
        shininess 10.0
 
        push_matrix
          rotate 90.0 1.0 0.0 0.0
          scale 35.0 35.0 1000.0
          cylinder 
        pop_matrix

        push_matrix
          rotate 90.0 0.0 1.0 0.0
          scale 35.0 35.0 1000.0
          cylinder 
        pop_matrix

        push_matrix
          translate 1000.0 1000.0 0.0
          rotate -90.0 0.0 1.0 0.0
          scale 35.0 35.0 1000.0
          cylinder 
        pop_matrix

        push_matrix
          translate 1000.0 1000.0 0.0
          rotate -90.0 1.0 0.0 0.0
          scale 35.0 35.0 1000.0
          cylinder 
        pop_matrix

}

{
        # cylinder cube frame around top plane
        cr 0.8 0.0 0.8
        cp 0.1 0.0 0.1
        shininess 10.0
 
        push_matrix
        translate 0.0 0.0 1000.0

          push_matrix
            rotate 90.0 1.0 0.0 0.0
            scale 35.0 35.0 1000.0
            cylinder 
          pop_matrix

          push_matrix
            rotate 90.0 0.0 1.0 0.0
            scale 35.0 35.0 1000.0
            cylinder 
          pop_matrix

          push_matrix
            translate 1000.0 1000.0 0.0
            rotate -90.0 0.0 1.0 0.0
            scale 35.0 35.0 1000.0
            cylinder 
          pop_matrix

          push_matrix
            translate 1000.0 1000.0 0.0
            rotate -90.0 1.0 0.0 0.0
            scale 35.0 35.0 1000.0
            cylinder 
          pop_matrix
        pop_matrix
}

{
        # cylinder cube frame vertically around box
        cr 0.8 0.0 0.8
        cp 0.1 0.0 0.1
        shininess 10.0
 
        push_matrix
          scale 35.0 35.0 1000.0
          cylinder 
        pop_matrix

        push_matrix
          translate 1000.0 0.0 0.0
          scale 35.0 35.0 1000.0
          cylinder 
        pop_matrix

        push_matrix
          translate 0.0 1000.0 0.0
          scale 35.0 35.0 1000.0
          cylinder 
        pop_matrix

        push_matrix
          translate 1000.0 1000.0 0.0
          scale 35.0 35.0 1000.0
          cylinder 
        pop_matrix
}

{
        #bottom
        ca 0.4 0.2 0.2
        cr 0.7 0.4 0.4
        cp 1.0 1.0 1.0
        shininess 100.0
 
        triangle 0.0 0.0 0.0  0.0 1000.0 0.0  1000.0 0.0 0.0
        triangle 0.0 1000.0 0.0  1000.0 1000.0 0.0  1000.0 0.0 0.0
}

{
        #top
        push_matrix
          translate 0.0 0.0 1000.0

          ca 0.4 0.2 0.2
          cr 0.7 0.4 0.4
          cp 1.0 1.0 1.0
          shininess 100.0
 
          triangle 0.0 0.0 0.0  0.0 1000.0 0.0  1000.0 0.0 0.0
          triangle 0.0 1000.0 0.0  1000.0 1000.0 0.0  1000.0 0.0 0.0
        pop_matrix
}

{
        #left
        push_matrix
          rotate -90.0 0.0 1.0 0.0

          ca 0.2 0.4 0.2
          cr 0.4 0.7 0.4
          cp 1.0 1.0 1.0
          shininess 100.0
 
          triangle 0.0 0.0 0.0  0.0 1000.0 0.0  1000.0 0.0 0.0
          triangle 0.0 1000.0 0.0  1000.0 1000.0 0.0  1000.0 0.0 0.0
        pop_matrix
}

{
        #right
        push_matrix
          translate 1000.0 0.0 0.0
          rotate -90.0 0.0 1.0 0.0

          ca 0.2 0.4 0.2
          cr 0.4 0.7 0.4
          cp 1.0 1.0 1.0
          shininess 100.0
 
          triangle 0.0 0.0 0.0  0.0 1000.0 0.0  1000.0 0.0 0.0
          triangle 0.0 1000.0 0.0  1000.0 1000.0 0.0  1000.0 0.0 0.0
        pop_matrix
}

{
        #front
        push_matrix
          rotate 90.0 1.0 0.0 0.0

          ca 0.2 0.2 0.4
          cr 0.4 0.4 0.7
          cp 1.0 1.0 1.0
          shininess 100.0
 
          triangle 0.0 0.0 0.0  0.0 1000.0 0.0  1000.0 0.0 0.0
          triangle 0.0 1000.0 0.0  1000.0 1000.0 0.0  1000.0 0.0 0.0
        pop_matrix
}

{
        #back
        push_matrix
          translate 0.0 1000.0 0.0
          rotate 90.0 1.0 0.0 0.0

          ca 0.2 0.2 0.4
          cr 0.4 0.4 0.7
          cp 1.0 1.0 1.0
          shininess 100.0
 
          triangle 0.0 0.0 0.0  0.0 1000.0 0.0  1000.0 0.0 0.0
          triangle 0.0 1000.0 0.0  1000.0 1000.0 0.0  1000.0 0.0 0.0
        pop_matrix
}

{
        #red ball
        ca 0.9 0.1 0.1
        cr 1.0 0.2 0.2
        cp 0.5 0.2 0.2

        push_matrix
          translate 200.0 775.0 650.0
          scale 1.1 0.8 0.9
          ball 39.0 0.0 0.0 0.0
        pop_matrix
}

{
        #red ball
        ca 0.9 0.1 0.1
        cr 1.0 0.2 0.2
        cp 0.5 0.2 0.2

        push_matrix
          translate 724.0 620.0 950.0
          scale 1.0 0.6 0.4
          ball 39.0 0.0 0.0 0.0
        pop_matrix
}

{
        #red ball
        ca 0.9 0.1 0.1
        cr 1.0 0.2 0.2
        cp 0.5 0.2 0.2

        push_matrix
          translate 430.0 138.0 74.0
          scale 1.4 1.1 0.9
          ball 38.0 0.0 0.0 0.0
        pop_matrix
}

{
        ca 0.9 0.1 0.1
        cr 1.0 0.2 0.2
        cp 0.5 0.2 0.2

        push_matrix
          translate 900.0 900.0 900.0
           scale 50 50 50
           object_flat dodecahedron.obj
        pop_matrix
}

{
        #red ball
        ca 0.9 0.1 0.1
        cr 1.0 0.2 0.2
        cp 0.5 0.2 0.2

        push_matrix
          translate 102.0 185.0 148.0
          scale 0.8 0.9 1.2
          ball 41.0 0.0 0.0 0.0
        pop_matrix
}

{
        #red ball
        ca 0.9 0.1 0.1
        cr 1.0 0.2 0.2
        cp 0.5 0.2 0.2

        push_matrix
          translate 502.0 589.0 448.0
          scale 0.7 0.8 1.5
          ball 40.0 0.0 0.0 0.0
        pop_matrix
}

{
        ca 0.9 0.1 0.1
        cr 1.0 0.2 0.2
        cp 0.5 0.2 0.2

        push_matrix
          translate 302.0 389.0 348.0
          scale 10 10 10
          object_phong dodecahedron.obj
        pop_matrix
}

{
        #red ball
        ca 0.9 0.1 0.1
        cr 1.0 0.2 0.2
        cp 0.5 0.2 0.2

        push_matrix
          translate 302.0 389.0 348.0
          scale 0.7 0.8 0.5
          ball 45.0 0.0 0.0 0.0
        pop_matrix
}

{
        ca 0.9 0.1 0.1
        cr 1.0 0.2 0.2
        cp 0.5 0.2 0.2

        push_matrix
          translate 785.0 375.0 103.0
          scale 15 15 15
          object_phong hexahedron.obj
        pop_matrix
}

{
        ca 0.9 0.1 0.1
        cr 1.0 0.2 0.2
        cp 0.5 0.2 0.2

        push_matrix
          translate 650.0 230.0 190.0
          rotate 100.0 .0 5.0 0.0
          scale 65 65 65
          object_flat dodecahedron.obj
        pop_matrix
}

{
        ca 0.1 0.9 0.1
        cr 0.2 1.0 0.2
        cp 0.2 0.5 0.2

        push_matrix
          translate 500.0 512.0 492.0
          scale 25 25 25
          object_phong octahedron.obj
        pop_matrix
}

{
        push_matrix
          translate 250 250 100
          pointlight 0 0 0  1.0 1.0 1.0
        pop_matrix
}

{
        push_matrix
          translate 750 800 750
          pointlight 0 0 0  1.0 1.0 1.0
        pop_matrix
}

end
