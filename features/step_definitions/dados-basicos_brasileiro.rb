Dado("o endereco da api de dados-basicos") do    
    $uri_base = "http://10.90.0.79:8140/cadastro-cliente/api/banco/v1/cadastro/brasileiro/dados-basicos"
    @auth = "Auth eyJhbGciOiJIUzUxMiIsInppcCI6IkRFRiJ9.eNqskMFqwzAMht_F52Kc0SRtb4rjFa3GDnJyKjtkWQ6FsYY5hcLYu9cZO6ylh9b0KOn_PiR9M394YyvWte-tH7_2vPvY9Z9jz2Zs530YpOIpn4upbEe2StIsm4tFvhQz1h-Hv0Yi0qnhu_3QB2bLnhsj0RrQWEKpOFTICw1yo9HVXFrjGl0DcVKuJpRWueC_wpBaB0ARl4QhPqXBrBWSDRIiVVsCXgFJBH2ToSBwqH8FkVgBRt4HV8o5Cy8NYYkSIgT_z47cOu5bF5s_RBJ7-PnbXn9OAAAA__8.DMWzLsWM5J87LdRwvxuZ1mpAV6RVJH76oBvM3_uUyCEjDrjh8Dv4hmtDvUdmdy2hF3nD4rEL8eZhs9pi0MgWtw"
  end
  
  Quando("faço uma requisicao de cadastro") do
    $response = HTTParty.post($uri_base, 
        :headers => {"Content-Type" => "application/json","auth" => @auth},
        :body => {
            "cpf":"41256297062",
            "indicador_id": -1,
            "nome":"Teste da Silva"
        }.to_json)
  end
  
  Entao("vejo que o cadastro é realizado") do
    expect($response.code).to eql(200)
    puts "response code #{$response.code}"
    puts "response body #{$response.body}"
  end