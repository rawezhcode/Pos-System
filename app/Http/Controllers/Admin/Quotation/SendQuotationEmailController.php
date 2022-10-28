<?php

namespace App\Http\Controllers\Admin\Quotation;

use App\Emails\QuotationMail;
use App\Models\Quotation;
use Illuminate\Contracts\Support\Renderable;
use Illuminate\Http\Request;
use Illuminate\Routing\Controller;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Mail;

class SendQuotationEmailController extends Controller
{
    public function __invoke(Quotation $quotation) {
        try {
            Mail::to($quotation->customer->customer_email)->send(new QuotationMail($quotation));

            $quotation->update([
                'status' => 'Sent'
            ]);

            notyf('Sent On "' . $quotation->customer->customer_email . '"!', 'success');

        } catch (\Exception $exception) {
            Log::error($exception);
            notyf('Something Went Wrong!', 'error');
        }

        return back();
    }
}
