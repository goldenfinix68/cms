<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Notifications\Notification;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use App\Borrow;
use Carbon\Carbon;

class NotifyBorrower extends Notification
{
    use Queueable;
    // public $user;
    public $borrow;
    /**
     * Create a new notification instance.
     *
     * @return void
     */
    public function __construct(Borrow $borrow)
    {
        $this->borrow = $borrow;
        
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
                    ->subject('Return Borrowed Component')
                    ->greeting('Hello '. $notifiable->name .' !')
                    ->line('The '. $this->borrow->component->name .' that you borrowed must be returned on or before '. Carbon::parse($this->borrow->return_date)->format('M d Y h:i A'))
                    ->action('Borrow logs', url('http://127.0.0.1:8000/borrowlogs'))
                    ->line('Thank you for using our application!');
    }

    /**
     * Get the array representation of the notification.
     *
     * @param  mixed  $notifiable
     * @return array
     */
    public function toArray($notifiable)
    {
        return [
            'subject' => 'Return borrowed component',
            'message' => 'Hello '. $notifiable->name .',  the '. $this->borrow->component->name .' that you borrowed must be returned on or before '. Carbon::parse($this->borrow->return_date)->format('M d Y h:i A'),
            'url' => '/borrowlogs',

        ];
    }
}
