function dh.mail.e2e
	echo $argv | read -l first rest
	git5 mail -m cying,lmeneses,pmediboina,samadlotia,dementsov --cc=double-helix-team -b $first -e --no-body $rest
end
