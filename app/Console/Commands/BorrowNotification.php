<?php

namespace App\Console\Commands;

use App\Borrow;
use App\Notifications\NotifyBorrower;
use App\Notifications\OverdueBorrower;
use Carbon\Carbon;
use Illuminate\Console\Command;

class BorrowNotification extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'notify:borrow';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Notify Users Borrow status';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return mixed
     */
    public function handle()
    {
        $borrows = Borrow::whereBetween('return_date', [Carbon::today(),Carbon::today()->addDays(3)])
            ->where('status', 'APPROVED')->get();

        $overdue = Borrow::whereDate('return_date', '<', Carbon::today())
            ->where('status', 'APPROVED')->get();

        if($borrows->count()){
            foreach($borrows as $borrow){
                $borrow->user->notify(new NotifyBorrower($borrow));
            }
        }

        if($overdue->count()){
            foreach($overdue as $borrow){
                $borrow->user->notify(new OverdueBorrower($borrow));
            }
        }
    }
}
