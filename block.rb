# block simples com repetição
5.times {puts "um block"}

puts"#" * 10

# block recebendo parâmetros usando função each para percorrer o array
sum = 0
numbers = [1, 2, 3, 4]
numbers.each {|number| sum += number }
puts sum

puts"#" * 10

# block de multiplas linhas

um_hash =  {1=>2, 2=>3, 3=>4}

um_hash.each do |key, value|
    puts "key = #{key}"
    puts "value = #{value}"
    puts "-----"
    if key == 3
        puts "A multiplicação da key com o value"
        puts "key * value = #{key * value}"
    end
end

# método que recebe um block como parâmetro
puts"#" * 10
def metodo
    yield
end

metodo{puts"método que recebe um block como parâmetro"}
puts"--------------"

metodo do
    puts " 123"
end
def bloco
    if block_given?
        yield
    else
        puts "sem parâmentro do tipo block"
    end
end

bloco
bloco{puts"com parâmentro do tipo bloco"}

# método com parâmetro normal juntamente com um parâmetro do tipo block

puts "#"*10
def metodo_2(name, &block)
    @name = name
    block.call
end

metodo_2('Valdemar') {puts"hellow #{@name}"}


# método com block dentro de outro block
puts "#" * 10
def metodo_3(numbers,&block)
    if block_given?
        numbers.each do |key, value|
            block.call(key, value)
        end
    end
end

numbers = {2 =>2, 3 =>3, 4 =>4}

metodo_3(numbers) do |key, value|
    puts "#{key} * #{value} = #{ key * value}" 
    puts "#{key} + #{value} = #{ key + value}"
    puts "----------"
end