<?php

// config/flasher.php
return [
    'default' => 'notyf',
    // "position" => ['x','center'],
    'flash_bag' => [
       
        'enabled' => false,
        
        
        'mapping' => [
            'success' => ['success'],
            'error' => ['error', 'danger'],
            'warning' => ['warning', 'alarm'],
            'info' => ['info', 'notice', 'alert'],
        ],
    ],
    'presets' => [
        
        'created' => [
            'type' => 'success',
            'message' => 'The resource was created',
        ],
        'updated' => [
            'type' => 'success',
            'message' => 'The resource was updated',
        ],
        'saved' => [
            'type' => 'success',
            'message' => 'The resource was saved',
        ],
        'deleted' => [
            'type' => 'success',
            'message' => 'The resource was deleted',
        ],
    ],
];