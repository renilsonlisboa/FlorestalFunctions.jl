module Functions

    export DescrtiptiveStatistics

    function DescriptiveStatistics(x)
        # Número de dados presentes em "X"
        n= length(x)

        Média = sum(x)/n

        pm = (maximum(x)+minimum(x))/2

        Mediana = if iseven(n)
                    median_value = (x[n ÷ 2] + x[n ÷ 2 + 1]) / 2
                  else
                    median_value = x[Int(n ÷ 2) + 1]
                  end

        Moda=mode(x)

        AT=maximum(x)-minimum(x)

        s²=var(x)

        s=std(x)

        cv=s/Média*100
        
    end

end
