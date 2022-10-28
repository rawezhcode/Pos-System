<?php

use App\Http\Controllers\Admin\Adjustment\AdjustmentController;
use App\Http\Controllers\Admin\Currency\CurrencyController;
use App\Http\Controllers\Admin\Expense\ExpenseCategoriesController;
use App\Http\Controllers\Admin\Expense\ExpenseController;
use App\Http\Controllers\Admin\People\CustomersController;
use App\Http\Controllers\Admin\People\SuppliersController;
use App\Http\Controllers\Admin\Product\BarcodeController;
use App\Http\Controllers\Admin\Product\CategoriesController;
use App\Http\Controllers\Admin\Product\ProductController;
use App\Http\Controllers\Admin\Purchase\PurchaseController;
use App\Http\Controllers\Admin\Purchase\PurchasePaymentsController;
use App\Http\Controllers\Admin\PurchasesReturn\PurchaseReturnPaymentsController;
use App\Http\Controllers\Admin\PurchasesReturn\PurchasesReturnController;
use App\Http\Controllers\Admin\Quotation\QuotationController;
use App\Http\Controllers\Admin\Quotation\QuotationSalesController;
use App\Http\Controllers\Admin\Quotation\SendQuotationEmailController;
use App\Http\Controllers\Admin\Reports\ReportsController;
use App\Http\Controllers\Admin\Sale\PosController;
use App\Http\Controllers\Admin\Sale\SaleController;
use App\Http\Controllers\Admin\Sale\SalePaymentsController;
use App\Http\Controllers\Admin\SalesReturn\SaleReturnPaymentsController;
use App\Http\Controllers\Admin\SalesReturn\SalesReturnController;
use App\Http\Controllers\Admin\Setting\SettingController;
use App\Http\Controllers\Admin\Upload\UploadController;
use App\Http\Controllers\Admin\User\ProfileController;
use App\Http\Controllers\Admin\User\RolesController;
use App\Http\Controllers\Admin\User\UsersController;
use App\Http\Controllers\HomeController;
use App\Models\Customer;
use App\Models\Purchase;
use App\Models\PurchaseReturn;
use App\Models\Quotation;
use App\Models\Sale;
use App\Models\SaleReturn;
use App\Models\Supplier;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Route::get('/dashboard', function () {
    return view('dashboard');
})->middleware(['auth', 'verified'])->name('dashboard');

require __DIR__.'/auth.php';



Route::group(['middleware' => 'auth'], function () {

    Route::get('/home', [HomeController::class,'index'])
    ->name('home');

    Route::get('/sales-purchases/chart-data', [HomeController::class,'salesPurchasesChart'])
        ->name('sales-purchases.chart');

    Route::get('/current-month/chart-data', [HomeController::class,'currentMonthChart'])
        ->name('current-month.chart');

    Route::get('/payment-flow/chart-data', [HomeController::class,'paymentChart'])
        ->name('payment-flow.chart');


    //User Profile
    Route::get('/user/profile', [ProfileController::class,'edit'])->name('profile.edit');
    Route::patch('/user/profile', [ProfileController::class,'update'])->name('profile.update');
    Route::patch('/user/password', [ProfileController::class,'updatePassword'])->name('profile.update.password');

    //Users
    Route::resource('users', UsersController::class)->except('show');

    //Roles
    Route::resource('roles', RolesController::class)->except('show');

    //Dropzone
    Route::post('/dropzone/upload', [UploadController::class,'dropzoneUpload'])->name('dropzone.upload');
    Route::post('/dropzone/delete', 'UploadController@dropzoneDelete')->name('dropzone.delete');
    //Filepond
    Route::post('/filepond/upload', [UploadController::class,'filepondUpload'])->name('filepond.upload');
    Route::delete('/filepond/delete', [UploadController::class,'filepondDelete'])->name('filepond.delete');

    //Product Adjustment
    Route::resource('adjustments', AdjustmentController::class);

    Route::resource('currencies', CurrencyController::class)->except('show');

    //Expense Category
    Route::resource('expense-categories', ExpenseCategoriesController::class)->except('show', 'create');
    //Expense
    Route::resource('expenses', ExpenseController::class)->except('show');

    //Customers
    Route::resource('customers', CustomersController::class);
    //Suppliers
    Route::resource('suppliers', SuppliersController::class);

    //Print Barcode
    Route::get('/products/print-barcode', [BarcodeController::class,'printBarcode'])->name('barcode.print');
    //Product
    Route::resource('products', ProductController::class);
    //Product Category
    Route::resource('product-categories', CategoriesController::class)->except('create', 'show');


    //Generate PDF
    Route::get('/purchases/pdf/{id}', function ($id) {
        $purchase = Purchase::findOrFail($id);
        $supplier = Supplier::findOrFail($purchase->supplier_id);

        $pdf = \PDF::loadView('Admin.purchase.print', [
            'purchase' => $purchase,
            'supplier' => $supplier,
        ])->setPaper('a4');

        return $pdf->stream('purchase-'. $purchase->reference .'.pdf');
    })->name('purchases.pdf');

    //Sales
    Route::resource('purchases', PurchaseController::class);

    //Payments
    Route::get('/purchase-payments/{purchase_id}', [PurchasePaymentsController::class,'index'])->name('purchase-payments.index');
    Route::get('/purchase-payments/{purchase_id}/create', [PurchasePaymentsController::class,'create'])->name('purchase-payments.create');
    Route::post('/purchase-payments/store', [PurchasePaymentsController::class,'store'])->name('purchase-payments.store');
    Route::get('/purchase-payments/{purchase_id}/edit/{purchasePayment}', [PurchasePaymentsController::class,'edit'])->name('purchase-payments.edit');
    Route::patch('/purchase-payments/update/{purchasePayment}', [PurchasePaymentsController::class,'update'])->name('purchase-payments.update');
    Route::delete('/purchase-payments/destroy/{purchasePayment}', [PurchasePaymentsController::class,'destroy'])->name('purchase-payments.destroy');


    //Generate PDF
    Route::get('/purchase-returns/pdf/{id}', function ($id) {
        $purchaseReturn = PurchaseReturn::findOrFail($id);
        $supplier = Supplier::findOrFail($purchaseReturn->supplier_id);

        $pdf = \PDF::loadView('Admin.purchasesreturn.print', [
            'purchase_return' => $purchaseReturn,
            'supplier' => $supplier,
        ])->setPaper('a4');

        return $pdf->stream('purchase-return-'. $purchaseReturn->reference .'.pdf');
    })->name('purchase-returns.pdf');

    //Purchase Returns
    Route::resource('purchase-returns', PurchasesReturnController::class);

    //Payments
    Route::get('/purchase-return-payments/{purchase_return_id}', [PurchaseReturnPaymentsController::class,'index'])
        ->name('purchase-return-payments.index');
    Route::get('/purchase-return-payments/{purchase_return_id}/create', [PurchaseReturnPaymentsController::class,'create'])
        ->name('purchase-return-payments.create');
    Route::post('/purchase-return-payments/store', [PurchaseReturnPaymentsController::class,'store'])
        ->name('purchase-return-payments.store');
    Route::get('/purchase-return-payments/{purchase_return_id}/edit/{purchaseReturnPayment}', [PurchaseReturnPaymentsController::class,'edit'])
        ->name('purchase-return-payments.edit');
    Route::patch('/purchase-return-payments/update/{purchaseReturnPayment}', [PurchaseReturnPaymentsController::class,'update'])
        ->name('purchase-return-payments.update');
    Route::delete('/purchase-return-payments/destroy/{purchaseReturnPayment}', [PurchaseReturnPaymentsController::class,'destroy'])
        ->name('purchase-return-payments.destroy');

    //Generate PDF
    Route::get('/quotations/pdf/{id}', function ($id) {
        $quotation = Quotation::findOrFail($id);
        $customer = Customer::findOrFail($quotation->customer_id);

        $pdf = \PDF::loadView('Admin.quotation.print', [
            'quotation' => $quotation,
            'customer' => $customer,
        ])->setPaper('a4');

        return $pdf->stream('quotation-'. $quotation->reference .'.pdf');
    })->name('quotations.pdf');

    //Send Quotation Mail
    Route::get('/quotation/mail/{quotation}', SendQuotationEmailController::class)->name('quotation.email');

    //Sales Form Quotation
    Route::get('/quotation-sales/{quotation}', QuotationSalesController::class)->name('quotation-sales.create');

    //quotations
    Route::resource('quotations', QuotationController::class);

    //Profit Loss Report
    Route::get('/profit-loss-report', [ReportsController::class,'profitLossReport'])
        ->name('profit-loss-report.index');
    //Payments Report
    Route::get('/payments-report', [ReportsController::class,'paymentsReport'])
        ->name('payments-report.index');
    //Sales Report
    Route::get('/sales-report', [ReportsController::class,'salesReport'])
        ->name('sales-report.index');
    //Purchases Report
    Route::get('/purchases-report', [ReportsController::class,'purchasesReport'])
        ->name('purchases-report.index');
    //Sales Return Report
    Route::get('/sales-return-report', [ReportsController::class,'salesReturnReport'])
        ->name('sales-return-report.index');
    //Purchases Return Report
    Route::get('/purchases-return-report', [ReportsController::class,'purchasesReturnReport'])
        ->name('purchases-return-report.index');



    //POS
    Route::get('/app/pos', [PosController::class,'index'])->name('app.pos.index');
    Route::post('/app/pos', [PosController::class,'store'])->name('app.pos.store');

    //Generate PDF
    Route::get('/sales/pdf/{id}', function ($id) {
        $sale = Sale::findOrFail($id);
        $customer = Customer::findOrFail($sale->customer_id);

        $pdf = \PDF::loadView('Admin.sale.print', [
            'sale' => $sale,
            'customer' => $customer,
        ])->setPaper('a4');

        return $pdf->stream('sale-'. $sale->reference .'.pdf');
    })->name('sales.pdf');

    Route::get('/sales/pos/pdf/{id}', function ($id) {
        $sale = Sale::findOrFail($id);

        $pdf = \PDF::loadView('Admin.sale.print-pos', [
            'sale' => $sale,
        ])->setPaper('a7')
            ->setOption('margin-top', 8)
            ->setOption('margin-bottom', 8)
            ->setOption('margin-left', 5)
            ->setOption('margin-right', 5);

        return $pdf->stream('sale-'. $sale->reference .'.pdf');
    })->name('sales.pos.pdf');

    //Sales
    Route::resource('sales', SaleController::class);

    //Payments
    Route::get('/sale-payments/{sale_id}', [SalePaymentsController::class,'index'])->name('sale-payments.index');
    Route::get('/sale-payments/{sale_id}/create', [SalePaymentsController::class,'create'])->name('sale-payments.create');
    Route::post('/sale-payments/store', [SalePaymentsController::class,'store'])->name('sale-payments.store');
    Route::get('/sale-payments/{sale_id}/edit/{salePayment}', [SalePaymentsController::class,'edit'])->name('sale-payments.edit');
    Route::patch('/sale-payments/update/{salePayment}', [SalePaymentsController::class,'update'])->name('sale-payments.update');
    Route::delete('/sale-payments/destroy/{salePayment}', [SalePaymentsController::class,'destroy'])->name('sale-payments.destroy');

    //Generate PDF
    Route::get('/sale-returns/pdf/{id}', function ($id) {
        $saleReturn = SaleReturn::findOrFail($id);
        $customer = Customer::findOrFail($saleReturn->customer_id);

        $pdf = \PDF::loadView('Admin.salesreturn.print', [
            'sale_return' => $saleReturn,
            'customer' => $customer,
        ])->setPaper('a4');

        return $pdf->stream('sale-return-'. $saleReturn->reference .'.pdf');
    })->name('sale-returns.pdf');

    //Sale Returns
    Route::resource('sale-returns', SalesReturnController::class);

    //Payments
    Route::get('/sale-return-payments/{sale_return_id}', [SaleReturnPaymentsController::class,'index'])
        ->name('sale-return-payments.index');
    Route::get('/sale-return-payments/{sale_return_id}/create', [SaleReturnPaymentsController::class,'create'])
        ->name('sale-return-payments.create');
    Route::post('/sale-return-payments/store', [SaleReturnPaymentsController::class,'store'])
        ->name('sale-return-payments.store');
    Route::get('/sale-return-payments/{sale_return_id}/edit/{saleReturnPayment}', [SaleReturnPaymentsController::class,'edit'])
        ->name('sale-return-payments.edit');
    Route::patch('/sale-return-payments/update/{saleReturnPayment}', [SaleReturnPaymentsController::class,'update'])
        ->name('sale-return-payments.update');
    Route::delete('/sale-return-payments/destroy/{saleReturnPayment}', [SaleReturnPaymentsController::class,'destroy'])
        ->name('sale-return-payments.destroy');


    //Mail Settings
    Route::patch('/settings/smtp', [SettingController::class,'updateSmtp'])->name('settings.smtp.update');
    //General Settings
    Route::get('/settings', [SettingController::class,'index'])->name('settings.index');
    Route::patch('/settings', [SettingController::class,'update'])->name('settings.update');
































});
