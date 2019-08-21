<?php

Route::group(["prefix" => "mail", "middleware" => []], function() {
    Route::post('/incore', 'MailController@emailIncore');
});