module Functions

  using Statistics
  using StatsBase
  using DataFrames
  using CSV
  using XLSX
  using QML

    export descriptiveStatistics

    function descriptiveStatistics(dados)

      DimDados = size(dados, 2) # Quantificação de colunas na Matriz
      Media = Vector{Float64}(undef,  DimDados) # Vetor de armazenamento da média
      Mediana = Vector{Float64}(undef,  DimDados) # Vetor de armazenamento da mediana
      DesvPad = Vector{Float64}(undef,  DimDados) # Vetor de armazenamento do desvio padrão
      ErroPad = Vector{Float64}(undef,  DimDados) # Vetor de armazenamento do erro padrão
      Var = Vector{Float64}(undef,  DimDados) # Vetor de armazenamento da variância
      Coef_Var = Vector{Float64}(undef,  DimDados) # Vetor de armazenamento do coeficiente de variação
      Min = Vector{Float64}(undef,  DimDados) # Vetor de armazenamento do valor mínimo
      Max = Vector{Float64}(undef,  DimDados) # Vetor de armazenamento do valor máximo
      Soma = Vector{Float64}(undef,  DimDados) # Vetor de armazenamento da soma dos valores
      Contagem = Vector{Float64}(undef,  DimDados) # Vetor de armazenamento da contagem dos dados
      resultado = Matrix{Float64}(undef, 11, DimDados) # Matriz de armazenamento dos resultados
      # Loop para cálculo das estatísticas variando de 1 até o número de colunas na matriz
      for i in 1:DimDados
          Media[i] = round(mean(dados[:,i]), digits = 2) # Cálculo da média
          Moda[i] = mode(dados[:,i])
          Mediana[i] = round(median(dados[:,i]), digits = 2) # Cálculo da mediana
          DesvPad[i] = round(std(dados[:,i]), digits = 2) # Cálculo do desvio padrão
          ErroPad[i] = round(DesvPad[i]/(sqrt(size(dados[:,i],1))), digits = 2) # Cálculo do erro padrão
          Var[i] = round(var(dados[:,i]), digits = 2) # Cálculo da variância
          Coef_Var[i] = round(((DesvPad[i]/Media[i])*100), digits = 2) # Cálculo do coeficiente de variação
          Min[i] = round(minimum(dados[:,i]), digits = 2) # Cálculo do valor mínimo
          Max[i] = round(maximum(dados[:,i]), digits = 2) # Cálculo do valor máximo
          Soma[i] = round(sum(dados[:,i]), digits = 2) # Soma dos valores
          Contagem[i] = round(size(dados[:,i],1), digits = 2) # Realização da contagem dos dados
          # Se i for igual ao número total de colunas, as variáveis de armazenamento serão unidas formando a matriz de resultados
          if i === (DimDados)
              resultado = [Media Mediana DesvPad ErroPad Var Coef_Var Min Max Soma Contagem] 
          end
      end

      stats_select = ["Média", "Moda", "Mediana", "Ponto Médio", "Amplitude Total", "Variância", "Desvio Padrão", "Coef. variação(%)", "Erro Padrão", "Minímo", "Maxímo", "Contagem"]


      for i in 1:DimDados
        if i === 1
          # Definição do DataFrame de resultados
          resultado = DataFrame([stats_select, d], ["Estatísticas", names(dados)[i]])
          
        else
          resultado_aux = DataFrame(Ddos = 1)
          resultado = hcat(resultado, resultado_aux)
      end  
  end