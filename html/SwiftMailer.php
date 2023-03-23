<?php

    function swift()
        {
        include_once('../vendor/autoload.php');
        try {
            // Create the Transport
            $transport = (new Swift_SmtpTransport('smtp.gmail.com', 465, 'SSL'))
                ->setUsername('name@gmail.com') // личные данные убраны с целью безопасности
                ->setPassword('password')
            ;


            // Create the Mailer using your created Transport
            $mailer = new Swift_Mailer($transport);

            // Create a message
            $message = (new Swift_Message('Wonderful Subject'))
                ->setFrom(['name@gmail.com' => 'It is me'])
                ->setTo(['name@gmail.com'])
                ->setBody('Here is the message itself')
            ;

            // Send the message
            $result = $mailer->send($message);
        } catch (Exception $e)
        {
            var_dump($e->getMessage());
        }

}

