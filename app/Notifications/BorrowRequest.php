<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Notifications\Notification;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use App\ComponentArchive;

class BorrowRequest extends Notification
{
    use Queueable;

    public $component;
    public $status;
    /**
     * Create a new notification instance.
     *
     * @return void
     */
    public function __construct(ComponentArchive $component, $status)
    {
        $this->component = $component;
        $this->status = $status;
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
        if($this->status){
            return (new MailMessage)
            ->subject('Borrow Component Request')
            ->greeting('Hello!')
            ->line('The '. $this->component->name .' with a model number of '. $this->component->model_number .' that you requested to borrow has been APPROVED.')
            ->line('The status of this request is now on ACCEPTED')
            ->line('Please proceed to the department and claim your borrowed component.')
            ->action('Borrow Logs', url('http://127.0.0.1:8000/borrowlogs'))
            ->line('Thank you and have a great day!');
        }
        else {
            return (new MailMessage)
            ->subject('Borrow Component Request')
            ->greeting('Hello!')
            ->line('The '. $this->component->name .' with a model number of '. $this->component->model_number .' that you requested to borrow has been DENIED.')
            ->line('The status of this request is now on DENIED')
            ->action('Borrow Logs', url('http://127.0.0.1:8000/borrowlogs'))
            ->line('Thank you and have a great day!');
        }
       
    }

    /**
     * Get the array representation of the notification.
     *
     * @param  mixed  $notifiable
     * @return array
     */
    public function toDatabase($notifiable)
    {
        if($this->status == true){
            return [
                'subject' => 'Borrow Component Request',
                'message' => 'The '. $this->component->name .' with a model number of '. $this->component->model_number .' that you requested to borrow has been APPROVED.',
                'url' => '/borrowlogs'
            ];
           
        } else if($this->status == false) {
           
            return [
                'subject' => 'Borrow Component Request',
                'message' => 'The '. $this->component->name .' with a model number of '. $this->component->model_number .' that you requested to borrow has been DENIED.',
                'url' => '/borrowlogs'
            ];
        }
    }
}
