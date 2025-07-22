@component('mail::message')
    Hi <b>{{ $user->name }}</b>
    <p>We Understand it happens.</p>
    <p>
        @component('mail::button', [
            'url' => url(
                'https://urban-edge-constructions-react-project-7efqbxm4o.vercel.app/reset-password/' . $user->remember_token),
        ])
            Reset Your Password
        @endcomponent
    </p>
    <p>In case you have any issues recovering your password, please contact us.</p>
    Thanks,<br>
    {{ config('app.name') }}
@endcomponent
