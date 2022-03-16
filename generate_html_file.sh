#!/bin/bash

PATHJOY=$(pwd)
source ${PATHJOY}/read_write_data.sh

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
    <title>Tiagod</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <style>
        .card {
            background-color: black;
            color: aqua;
        }

    </style>
</head>
<body>
    $(cat logs_html.txt)
</body>
</html>
END
