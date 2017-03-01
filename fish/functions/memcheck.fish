function memcheck
	set avail (free | grep Mem | awk '{print($4/$2 * 100)}')
  echo $avail
end
