module OptimNewton

function optimize_newton(x, f, g, h;
                         grtol=1e-4,
                         gatol=1e-4,
                         prints=false)
    while true
        fx = f(x)
        gx = g(x)
        hx = h(x)
        #convergence
        abs(abs(gx) / fx) <= grtol && break
        abs(gx) <= gatol && break

        if prints
            println("|G| = $(abs(gx))")
        end

        #move to next p
        x -= gx / hx
    end
    return x
end

end # module
