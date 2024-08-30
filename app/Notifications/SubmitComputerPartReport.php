<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Notifications\Notification;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use App\Computerpart;

class SubmitComputerPartReport extends Notification
{
    use Queueable;

    public $computerpart;
    public $sender;

    /**
     * Create a new notification instance.
     *
     * @return void
     */
    public function __construct(Computerpart $computerpart, $sender)
    {
        $this->computerpart = $computerpart;
        $this->sender = $sender;
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
            ->line('The introduction to the notification.')
            ->action('Notification Action', url('/'))
            ->line('Thank you for using our application!');
    }

    /**
     * Get the array representation of the notification.
     *
     * @param  mixed  $notifiable
     * @return array
     */
    // public function toArray($notifiable)
    // {
    //     return [
    //         'data' => 'Sample notification'
    //     ];
    // }

    public function toDatabase($notifiable)
    {
        return [
            'subject' => 'Report submission',
            'message' => 'The '. $this->computerpart->brand .' with a model number of '.$this->computerpart->model_number.' has been reported by '. $this->sender,
            'url' => '/reports'
        ];
    }
}
