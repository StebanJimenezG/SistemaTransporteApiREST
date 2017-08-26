class Vehicle < ApplicationRecord

# Validación de placa unica

validates_uniqueness_of :placa, message: "La placa debe ser unica"

# Validacion para que las placas comiencen con ABC o DEF

validates_format_of :placa,
                    with:/\A(ABC+[0-9])|\A(DEF+[0-9])/, on: :create, message: "La placa debe empezar por (ABC o DEF) seguida de numeros "

# Validación de campos obligatorios

validates :color, presence: true
validates :año, presence: true


# Metodo que determina si la placa empieza por ABC o DEF y según eso la categoría es 1 o 2 respectivamente

def category(placa)
subPlaca=placa[0..2]
puts(subPlaca)
  if (subPlaca == "ABC" ) then
      categoria = 1

else
  categoria = 2
  puts(categoria)
  end
  return categoria
    end
      end




