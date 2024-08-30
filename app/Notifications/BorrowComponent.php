<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Notifications\Notification;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use App\Component;

class BorrowComponent extends Notification
{
    use Queueable;

    public $component;
    public $borrower;

    /**
     * Create a new notification instance.
     *
     * @return void
     */
    public function __construct(Component $component, $borrower)
    {
        $this->component = $component;
        $this->borrower = $borrower;

    }

    /**
     * Get the notification's delivery channels.
     *
     * @param  mixed  $notifiable
     * @return array
     */
    public function via($notifiable)
    {
        return ['database'];
    }

    /**
     * Get the mail representation of the notification.
     *
     * @param  mixed  $notifiable
     * @return \Illuminate\Notifications\Messages\MailMessage
     */
    public function toMail($notifiable)
    {
        return (new MailMessage)
                    ->subject('Borrow Component Request')
                    ->greeting('Hello!')
                    ->line('Mr/Ms. '. $this->borrower .' has requested to borrow '. $this->component->name .' with a model number of '. $this->component->model_number)
                    ->line('The status of this request is now on PENDING')
                    ->action('Borrow Logs', url('http://127.0.0.1:8000/borrowlogs'))
                    ->line('Thank you and have a great day!');
    }

    /**
     * Get the array representation of the notification.
     *
     * @param  mixed  $notifiable
     * @return array
     */
    public function toDatabase($notifiable)
    {
        $message = 'Mr/Ms. '. $this->borrower .' has requested to borrow the '. $this->component->name .' with a model number of '. $this->component->model_number;


        return [
            'subject' => 'Borrow Component Request',
            'message' => $message,
            'url' => '/borrowlogs'
        ];
    }
}
