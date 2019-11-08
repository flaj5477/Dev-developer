var str;

function formatDifficulty(value) {
	//난이도
	switch(value) {
	case 1 : str='Easy'; break;
	case 2 : str='Normal'; break;
	case 3 : str='Hard'; break;
	case 4 : str='Professional'; break;
	case 5 : str='Ultimate'; break;
	}
	return str;
}
function formatGrade(value) {
	//등급
	switch(value) {
	case 1 : str='Bronze'; break;
	case 2 : str='Silver'; break;
	case 3 : str='Gold'; break;
	case 4 : str='Diamond'; break;
	case 5 : str='Challenger'; break;
	}
	return str;
}