source /home/tiago/Servidores-de-Rede/read_write_data.sh

#Verifica se existe o arquivo logs_html.txt
if [ ! -f 'logs_html.txt' ];
    then
        $(touch logs_html.txt)
fi

    if [ ! -f 'index.html' ]; then
        $(touch index.html)
    fi

    cat > index.html << END
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    $(cat logs_html.txt)
</body>
</html>
END
