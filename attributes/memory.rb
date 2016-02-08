# Enable Auto Memory -Xmx java option
default['jlsolrcloud']['auto_java_memory'] = true

# Minimum Memory to preserve for system
default['jlsolrcloud']['auto_system_memory'] = 768

# Calculate -Xmx (Multiple of 1024)
if node['jlsolrcloud']['auto_java_memory'] && \
   node['memory'] && node['memory'].key?('total')
  total_memory = (node['memory']['total'].gsub('kB', '').to_i / 1024).to_i
  total_memory_percentage = (total_memory % 1024)
  system_memory = if total_memory < 2048
                    total_memory / 2
                  elsif total_memory_percentage >= \
                        node['jlsolrcloud']['auto_system_memory'].to_i
                    total_memory_percentage
                  else
                    total_memory_percentage + 1024
                  end

  java_memory = total_memory - system_memory
  # Making Java -Xmx even
  java_memory += 1 unless java_memory.even?
  initial_memory = if java_memory > 512
                     512
                   else
                     (java_memory * 0.5).to_i
                   end
  node.default['jlsolrcloud']['java_mem_options'] = \
    "-Xms#{initial_memory}m -Xmx#{java_memory}m"
end
